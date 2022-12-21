// ignore: file_names
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchTypeDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/UserLikeResponse.dart';
import 'package:flutter_application_1/Screens/AramaSonuclari.dart';
import 'package:flutter_application_1/models/ForLikeInformation/forLikeList.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDetailSearchDtoInformation.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDtoInformation.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/models/SearchTypeInformation/searchTypeInformation.dart';
import 'package:flutter_application_1/services/DropDownServices/SearchTypeDropdownService.dart';
import 'package:flutter_application_1/services/JudgmentServices/judgmentService.dart';
import 'package:flutter_application_1/services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import 'package:flutter_application_1/services/UserLikeServices/UserLikeService.dart';
import 'package:flutter_application_1/widgets/ModalBottomDetayl%C4%B1Arama.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../ApiResponse/CommissionDropdownResponse.dart';
import '../ApiResponse/CourtDropdownResponse.dart';
import '../AppConfigurations/appConfigurations.dart';
import '../models/CommissionInformation/commissionInformation.dart';
import '../models/CourtInformation/CourtInformation.dart';
import '../models/EDecisionTypes.dart';
import '../services/DropDownServices/CommissionDropdownService.dart';
import '../services/DropDownServices/CourtDropdownService.dart';

class KararArama extends StatefulWidget {
  const KararArama({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KararAramaState createState() => _KararAramaState();
}

enum YuksekYargi { yargitay, danistay, anayasaMahkemesi }

YuksekYargi? _yuksekYargi = YuksekYargi.yargitay;

class _KararAramaState extends State<KararArama> {
  final searchController = TextEditingController();
  bool isVisible = false;
  JudgmentDtoInformation judgmentDtoInformation = JudgmentDtoInformation();
  TextEditingController meritsYearController = TextEditingController();
  TextEditingController firstMeritsNoController = TextEditingController();
  TextEditingController lastMeritsNoController = TextEditingController();
  TextEditingController decreeYearController = TextEditingController();
  TextEditingController firstDecreeNoController = TextEditingController();
  TextEditingController lastDecreeNoController = TextEditingController();
  TextEditingController firstDateController = TextEditingController();
  TextEditingController lastDateController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '##-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final bool _isTap = false;
  final SearchTypeDropdownService searchTypeDropdownService =
      getIt.get<SearchTypeDropdownService>();
  final JudgmentService judgmentService = getIt.get<JudgmentService>();
  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();
  final CommissionDropdownService commissionDropdownService =
      getIt.get<CommissionDropdownService>();
  final CourtDropdownService courtDropdownService =
      getIt.get<CourtDropdownService>();
  int? lookCourt;
  CommissionInformation? selectedCommission;
  List<CommissionInformation> commissionInformation = [];
  CourtInformation? selectedCourt;
  DateTime? selectedFirstDate;
  DateTime? selectedLastDate;
  List<CourtInformation> courtInformation = [];

  final UserLikeService userLikeService = getIt.get<UserLikeService>();

  List<SearchTypeInformation> searchTypeInformation = [];
  List<LawyerJudgmentListInformation> judgments = [];
  List<ForLikeList> userLikes = [];
  SearchTypeInformation? selectedOption;
  int? decisionValue;

  @override
  void initState() {
    // TODO: implement initState
    getCommissions();
    getAllCourts();
    super.initState();
    getSearchTypes();
  }

  // This function is called whenever the text field changes

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 80),
                // ignore: prefer_const_constructors
                child: Image(
                  image: const AssetImage("assets/images/login-logo.png"),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
                width: MediaQuery.of(context).size.height / 2.3,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Ara',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 252, 252, 252),
                    focusedBorder: OutlineInputBorder(
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  controller: searchController,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15.4,
                width: MediaQuery.of(context).size.height / 2.3,
                child: DropdownButtonFormField<SearchTypeInformation>(
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 60),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(40)),

                      // ignore: prefer_const_constructors
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(40))),
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                  value: selectedOption == null
                      ? (searchTypeInformation.isEmpty
                          ? null
                          : selectedOption = searchTypeInformation.first)
                      : selectedOption,

                  onChanged: (SearchTypeInformation? newValue) {
                    setState(() {
                      //selectedOption = newValue;
                      if (newValue!.TypeID == 2) {
                        isVisible = true;
                        selectedOption = newValue;
                      } else if (newValue.TypeID == 1) {
                        isVisible = false;
                        selectedOption = newValue;
                      }
                      print(selectedOption!.TypeID.toString());
                    });
                  },

                  validator: (value) =>
                      value == null ? "Bu alan boş bırakılamaz" : null,
                  items: searchTypeInformation
                      .map((SearchTypeInformation searchTypeInformation) {
                    return DropdownMenuItem<SearchTypeInformation>(
                      value: searchTypeInformation,
                      child: Text(
                        searchTypeInformation.TypeName!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                          activeColor: const Color.fromARGB(255, 1, 28, 63),
                          title: Transform.translate(
                              offset: const Offset(-20, 0),
                              child: const Text(
                                  style: TextStyle(fontSize: 11), 'Yargıtay')),
                          value: YuksekYargi.yargitay,
                          groupValue: _yuksekYargi,
                          onChanged: (YuksekYargi? value) {
                            setState(() {
                              _yuksekYargi = value;
                              decisionValue = EDecisionTypes.Yargitay;
                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        activeColor: const Color.fromARGB(255, 1, 28, 63),
                        title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: const Text(
                                style: TextStyle(fontSize: 11), 'Danıştay')),
                        value: YuksekYargi.danistay,
                        groupValue: _yuksekYargi,
                        onChanged: ((YuksekYargi? value) {
                          setState(() {
                            _yuksekYargi = value;
                            decisionValue = EDecisionTypes.Danistay;
                            print(decisionValue);
                          });
                        }),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        enableFeedback: true, //
                        activeColor: const Color.fromARGB(255, 1, 28, 63),
                        title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: const Text(
                              maxLines: 2,
                              style: TextStyle(fontSize: 10.2),
                              'Anayasa Mahkemesi',
                              // overflow: TextOverflow.fade,
                            )),
                        value: YuksekYargi.anayasaMahkemesi,
                        groupValue: _yuksekYargi,
                        onChanged: ((YuksekYargi? value) {
                          setState(() {
                            _yuksekYargi = value;
                            decisionValue = EDecisionTypes.AnayasaMahkemesi;
                            print(decisionValue);
                          });
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        minimumSize: const Size(350, 55),
                        backgroundColor: const Color.fromARGB(255, 1, 28, 63)),
                    onPressed: () {
                      judgmentDtoInformation = JudgmentDtoInformation(
                          keyword: searchController.text,
                          searchTypeID:
                              selectedOption!.TypeID, //boş olunca hata veriyo
                          judgmentTypeID: decisionValue);
                      if (selectedOption!.TypeID == 1) {
                        userLike(selectedOption!.TypeID!);
                      } else {
                        userLike(selectedOption!.TypeID!);
                      }
                    },
                    child: const Text(
                      'Arama Yap',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        minimumSize: const Size(350, 55),
                        backgroundColor:
                            const Color.fromARGB(255, 126, 126, 126)),
                    onPressed: () => showModalBottomSheet<void>(
                        isScrollControlled: true,
                        useRootNavigator: false,
                        // backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder:
                              ((BuildContext context, StateSetter setState) {
                            return SingleChildScrollView(
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: (MediaQuery.of(context)
                                                .size
                                                .height /
                                            30)),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: const Text('Detaylı Arama',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        right:
                                            MediaQuery.of(context).size.width /
                                                25,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                25,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Form(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text('Kelime ile Arama'),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      80),
                                              TextFormField(
                                                controller: searchController,

                                                // ignore: prefer_const_constructors
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromARGB(
                                                          255, 255, 255, 255),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8))),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    // ignore: prefer_const_constructors
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              189,
                                                              189,
                                                              189),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // ignore: prefer_const_constructors

                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    80,
                                              ),

                                              const Text('Daire/Kurul Adı*'),
                                              Container(
                                                height: 45,
                                                width: 330,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.white),
                                                child: DropdownButtonFormField<
                                                    CommissionInformation>(
                                                  isExpanded: true,
                                                  //underline: SizedBox.shrink(),
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down_outlined),
                                                  dropdownColor: Colors.white,
                                                  value: selectedCommission,
                                                  onChanged:
                                                      (CommissionInformation?
                                                          newValue) {
                                                    setState(() {
                                                      selectedCommission =
                                                          newValue;
                                                      lookCourt =
                                                          selectedCommission!
                                                              .CommissionID;
                                                      print("Daire");
                                                      print(selectedCommission!
                                                          .CommissionID
                                                          .toString());
                                                      // selectedCourt = null;
                                                      // getCourts(lookCourt);

                                                      //selectedCourt = null;
                                                    });

                                                    //selectedCommission = null;
                                                  },

                                                  // validator: (value) => value ==
                                                  //         null
                                                  //     ? "Bu alan boş bırakılamaz"
                                                  //     : null,
                                                  items: commissionInformation
                                                      .map((CommissionInformation
                                                          commissionInformation) {
                                                    return DropdownMenuItem<
                                                        CommissionInformation>(
                                                      value:
                                                          commissionInformation,
                                                      child: Text(
                                                        commissionInformation
                                                            .CommissionName!,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      35),
                                              const Text('Mahkeme'),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      65),
                                              Container(
                                                height: 45,
                                                width: 330,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.white),
                                                child: DropdownButtonFormField<
                                                    CourtInformation>(
                                                  isExpanded: true,
                                                  //underline: SizedBox.shrink(),
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down_outlined),
                                                  dropdownColor: Colors.white,
                                                  value: selectedCourt,
                                                  onChanged: (CourtInformation?
                                                      newValue) {
                                                    setState(() {
                                                      selectedCourt = newValue;
                                                      print(selectedCourt!
                                                          .CourtID
                                                          .toString());
                                                    });
                                                  },

                                                  items: courtInformation.map(
                                                      (CourtInformation
                                                          courtInformation) {
                                                    return DropdownMenuItem<
                                                        CourtInformation>(
                                                      value: courtInformation,
                                                      child: Text(
                                                        courtInformation
                                                            .CourtName!,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    80,
                                              ),

                                              const Text('Esas Numarası'),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    80,
                                              ),

                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      child: TextFormField(
                                                          controller:
                                                              meritsYearController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            LengthLimitingTextInputFormatter(
                                                                11)
                                                          ],
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'Esas Yılı',
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8))),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          189,
                                                                          189,
                                                                          189),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8))),
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              20),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      child: TextFormField(
                                                          controller:
                                                              firstMeritsNoController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            LengthLimitingTextInputFormatter(
                                                                11)
                                                          ],
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'İlk Sıra No',
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8))),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          189,
                                                                          189,
                                                                          189),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8))),
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              20),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            LengthLimitingTextInputFormatter(
                                                                11)
                                                          ],
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'Son Sıra No',
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8))),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          189,
                                                                          189,
                                                                          189),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8))),
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      80),
                                              const Text('Karar Numarası'),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      80),

                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            LengthLimitingTextInputFormatter(
                                                                11)
                                                          ],
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'Karar Yılı',
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8))),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          189,
                                                                          189,
                                                                          189),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8))),
                                                          )),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            LengthLimitingTextInputFormatter(
                                                                11)
                                                          ],
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'İlk Sıra No',
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8))),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          189,
                                                                          189,
                                                                          189),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8))),
                                                          )),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: [
                                                            maskFormatter
                                                          ],
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'Son Sıra No',
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8))),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          189,
                                                                          189,
                                                                          189),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8))),
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    80,
                                              ),
                                              const Text('Karar Aralığı'),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    80,
                                              ),

                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .datetime,
                                                        inputFormatters: [
                                                          maskFormatter
                                                        ],

                                                        controller:
                                                            firstDateController,
                                                        //editing controller of this TextField
                                                        decoration:
                                                            InputDecoration(
                                                                prefixIcon: Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: _isTap
                                                                        ? Colors
                                                                            .grey
                                                                        : Colors
                                                                            .black),
                                                                prefixIconColor:
                                                                    Colors.grey,
                                                                filled: true,
                                                                fillColor:
                                                                    const Color.fromARGB(
                                                                        246,
                                                                        246,
                                                                        246,
                                                                        246),
                                                                focusedBorder:
                                                                    const OutlineInputBorder(
                                                                        borderRadius: BorderRadius.all(Radius.circular(
                                                                            8))),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  // ignore: prefer_const_constructors
                                                                  borderSide:
                                                                      BorderSide(
                                                                    width: 1,
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        189,
                                                                        189,
                                                                        189),
                                                                  ),
                                                                ),
                                                                hintText:
                                                                    'Başlangıç Tarihi',
                                                                hintStyle: const TextStyle(
                                                                    color: Colors.grey) //icon of text field
                                                                //labelText: "" //label text of field
                                                                ),

                                                        //set it true, so that user will not able to edit text
                                                        onTap: () async {
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                                  locale:
                                                                      const Locale(
                                                                          "tr",
                                                                          "TR"),
                                                                  builder: (BuildContext
                                                                          context,
                                                                      child) {
                                                                    return Theme(
                                                                      data: Theme.of(
                                                                              context)
                                                                          .copyWith(
                                                                        colorScheme:
                                                                            ColorScheme.light(
                                                                          primary:
                                                                              HexColor('#5DB075'), // header background color
                                                                          onPrimary:
                                                                              Colors.white, // header text color
                                                                          onSurface: const Color.fromARGB(
                                                                              255,
                                                                              20,
                                                                              20,
                                                                              20), // body text color
                                                                        ),
                                                                        textButtonTheme:
                                                                            TextButtonThemeData(
                                                                          style:
                                                                              TextButton.styleFrom(
                                                                            foregroundColor: const Color.fromARGB(
                                                                                255,
                                                                                23,
                                                                                48,
                                                                                112), // button text color
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          child!,
                                                                    );
                                                                  },
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1881),
                                                                  //DateTime.now() - not to allow to choose before today.
                                                                  lastDate:
                                                                      DateTime(
                                                                          2100));

                                                          if (pickedDate !=
                                                                  null &&
                                                              pickedDate !=
                                                                  selectedFirstDate) {
                                                            setState(() {
                                                              selectedFirstDate =
                                                                  pickedDate;
                                                              firstDateController
                                                                  .text = DateFormat(
                                                                      "dd-MM-yyyy")
                                                                  .format(
                                                                      pickedDate);
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              50),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      child: TextFormField(
                                                        controller:
                                                            lastDateController,
                                                        keyboardType:
                                                            TextInputType
                                                                .datetime,
                                                        inputFormatters: [
                                                          maskFormatter
                                                        ],
                                                        //editing controller of this TextField
                                                        decoration:
                                                            InputDecoration(
                                                                prefixIcon: Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: _isTap
                                                                        ? Colors
                                                                            .grey
                                                                        : Colors
                                                                            .black),
                                                                prefixIconColor:
                                                                    Colors.grey,
                                                                filled: true,
                                                                fillColor:
                                                                    const Color.fromARGB(
                                                                        246,
                                                                        246,
                                                                        246,
                                                                        246),
                                                                focusedBorder:
                                                                    const OutlineInputBorder(
                                                                        borderRadius: BorderRadius.all(Radius.circular(
                                                                            8))),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  // ignore: prefer_const_constructors
                                                                  borderSide:
                                                                      BorderSide(
                                                                    width: 1,
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        189,
                                                                        189,
                                                                        189),
                                                                  ),
                                                                ),
                                                                hintText:
                                                                    'Bitiş Tarihi',
                                                                hintStyle: const TextStyle(
                                                                    color: Colors.grey) //icon of text field
                                                                //labelText: "" //label text of field
                                                                ),

                                                        //set it true, so that user will not able to edit text
                                                        onTap: () async {
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                                  locale:
                                                                      const Locale(
                                                                          "tr",
                                                                          "TR"),
                                                                  builder: (BuildContext
                                                                          context,
                                                                      child) {
                                                                    return Theme(
                                                                      data: Theme.of(
                                                                              context)
                                                                          .copyWith(
                                                                        colorScheme:
                                                                            ColorScheme.light(
                                                                          primary:
                                                                              HexColor('#5DB075'), // header background color
                                                                          onPrimary:
                                                                              Colors.white, // header text color
                                                                          onSurface: const Color.fromARGB(
                                                                              255,
                                                                              20,
                                                                              20,
                                                                              20), // body text color
                                                                        ),
                                                                        textButtonTheme:
                                                                            TextButtonThemeData(
                                                                          style:
                                                                              TextButton.styleFrom(
                                                                            foregroundColor: const Color.fromARGB(
                                                                                255,
                                                                                23,
                                                                                48,
                                                                                112), // button text color
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          child!,
                                                                    );
                                                                  },
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1881),
                                                                  //DateTime.now() - not to allow to choose before today.
                                                                  lastDate:
                                                                      DateTime(
                                                                          2100));

                                                          if (pickedDate !=
                                                                  null &&
                                                              pickedDate !=
                                                                  selectedLastDate) {
                                                            setState(() {
                                                              selectedLastDate =
                                                                  pickedDate;
                                                              lastDateController
                                                                  .text = DateFormat(
                                                                      "dd-MM-yyyy")
                                                                  .format(
                                                                      pickedDate);
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            minimumSize:
                                                                const Size(
                                                                    150, 45),
                                                            backgroundColor:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    194,
                                                                    27,
                                                                    5)),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Vazgeç',
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            minimumSize:
                                                                const Size(
                                                                    150, 45),
                                                            backgroundColor:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    1,
                                                                    28,
                                                                    63)),
                                                    onPressed: () {
                                                      JudgmentDetailSearchDto judgmentDetailSearchDto = JudgmentDetailSearchDto(
                                                          keyword: searchController
                                                              .text,
                                                          searchTypeID: selectedOption!
                                                              .TypeID,
                                                          courtId: selectedCourt?.CourtID == null
                                                              ? 0
                                                              : selectedCourt!
                                                                  .CourtID,
                                                          commissionId: selectedCommission
                                                                      ?.CommissionID ==
                                                                  null
                                                              ? 0
                                                              : selectedCommission!
                                                                  .CommissionID,
                                                          meritsYear:
                                                              meritsYearController
                                                                  .text,
                                                          meritsFirstOrder:
                                                              firstMeritsNoController
                                                                  .text,
                                                          meritsLastOrder:
                                                              lastMeritsNoController
                                                                  .text,
                                                          decreeYear:
                                                              decreeYearController
                                                                  .text,
                                                          decreeFirstOrder:
                                                              firstDecreeNoController
                                                                  .text,
                                                          decreeLastOrder:
                                                              lastDecreeNoController
                                                                  .text,
                                                          firstDate:
                                                              selectedFirstDate,
                                                          lastDate:
                                                              selectedLastDate,
                                                          judgmentTypeID:
                                                              decisionValue);
                                                      if (selectedOption!
                                                              .TypeID ==
                                                          1) {
                                                        getLawyerJudgmentsbyDetailSearch(
                                                            judgmentDetailSearchDto);
                                                      } else {
                                                        getJudgmentsbyDetailSearch(
                                                            judgmentDetailSearchDto);
                                                      }
                                                    },
                                                    child: const Text(
                                                      'Arama Yap',
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      30),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          }));
                        }),
                    child: const Text(
                      'Detaylı Arama',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getSearchTypes() async {
    SearchTypeInformationResponse response =
        await searchTypeDropdownService.getSearchTypes();
    if (response.hasError == false) {
      searchTypeInformation.addAll(response.searchTypeInformation);

      setState(() {});
      print(response.searchTypeInformation.length);
    } else {
      print(response.errorMessage);
    }
  }

  getJudgments(JudgmentDtoInformation judgmentDtoInformation) async {
    try {
      SearchDataLawyerResponse response =
          await judgmentService.getJudgments(judgmentDtoInformation);
      if (response.success == true) {
        judgments.clear();
        judgments.addAll(response.data!);

        if (userLikes.length != 0) {
          for (var item in judgments) {
            int i = 0;
            if (item.id == userLikes[i].judgmentId) {
              item.isLike = userLikes[i].isLike!;
            }

            i++;
          }
        }
        print(response.success);
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AramaSonuclari(
                        judgments: judgments,
                        searchTypeId: selectedOption!.TypeID,
                      )));
        });

        print(response);
      } else {
        print(response.message);
      }
    } catch (e) {
      print(e);
    }
  }

  getLawyerJudgments(JudgmentDtoInformation judgmentDtoInformation) async {
    try {
      SearchDataLawyerResponse response = await lawyerJudgmentService
          .getLawyerJudgments(judgmentDtoInformation);
      if (response.success == true) {
        judgments.clear();
        judgments.addAll(response.data!);

        if (userLikes.length != 0) {
          for (var item in judgments) {
            int i = 0;
            if (item.id == userLikes[i].judgmentId) {
              item.isLike = userLikes[i].isLike!;
            }

            i++;
          }
        }

        // for (var item in judgments) {
        //   int i = 0;
        //   if (item.id == userLikes[i].judgmentId &&
        //       userLikes[i].judgmentId == 1) {
        //     item.isLike = userLikes[i].isLike;
        //   }

        //   i++;
        // }
        print(response.success);
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AramaSonuclari(
                        searchTypeId: selectedOption!.TypeID,
                        judgments: judgments,
                      )));
        });

        print(response);
      } else {
        print(response.message);
      }
    } catch (e) {
      print(e);
    }
  }

  getLawyerJudgmentsbyDetailSearch(
      JudgmentDetailSearchDto judgmentDetailSearchDto) async {
    try {
      SearchDataLawyerResponse response = await lawyerJudgmentService
          .getLawyerJudgmentsbyDetailSearch(judgmentDetailSearchDto);
      if (response.success == true) {
        judgments.clear();
        judgments.addAll(response.data!);

        // for (var item in judgments) {
        //   int i = 0;
        //   if (item.id == userLikes[i].judgmentId &&
        //       userLikes[i].judgmentId == 1) {
        //     item.isLike = userLikes[i].isLike;
        //   }

        //   i++;
        // }
        print(response.success);
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AramaSonuclari(
                        searchTypeId: selectedOption!.TypeID,
                        judgments: judgments,
                      )));
        });

        print(response);
      } else {
        print(response.message);
      }
    } catch (e) {
      print(e);
    }
  }

  getJudgmentsbyDetailSearch(
      JudgmentDetailSearchDto judgmentDetailSearchDto) async {
    try {
      SearchDataLawyerResponse response = await judgmentService
          .getJudgmentsbyDetailSearch(judgmentDetailSearchDto);
      if (response.success == true) {
        judgments.clear();
        judgments.addAll(response.data!);

        // for (var item in judgments) {
        //   int i = 0;
        //   if (item.id == userLikes[i].judgmentId &&
        //       userLikes[i].judgmentId == 1) {
        //     item.isLike = userLikes[i].isLike;
        //   }

        //   i++;
        // }
        print(response.success);
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AramaSonuclari(
                        searchTypeId: selectedOption!.TypeID,
                        judgments: judgments,
                      )));
        });

        print(response);
      } else {
        print(response.message);
      }
    } catch (e) {
      print(e);
    }
  }

  userLike(int searchTypeId) async {
    //geriyebasıncabozuluyop
    try {
      print(searchTypeId);
      UserLikeResponse response = await userLikeService.userLike(searchTypeId);
      if (response.success == true) {
        userLikes.clear();
        userLikes.addAll(response.data!);
        print(response.success);
//        setState(() {});
        if (selectedOption?.TypeID == 1) {
          getLawyerJudgments(judgmentDtoInformation);
        } else {
          getJudgments(judgmentDtoInformation);
        }

        print(response);
      } else {
        print(response.message);
      }
    } catch (e) {
      print(e);
    }
  }

  getCommissions() async {
    CommissionInformationResponse response =
        await commissionDropdownService.getCommissions();
    if (response.hasError == false) {
      commissionInformation.clear();
      commissionInformation.addAll(response.commissionInformation);

      print(response.commissionInformation.length);
      setState(() {});
    } else {
      print(response.errorMessage);
    }
  }

  getCourts(int? id) async {
    CourtInformationResponse response =
        await courtDropdownService.getCourts(id!);
    if (response.success == true) {
      courtInformation.clear();
      courtInformation.addAll(response.courtInformation);

      setState(() {
        print(response.courtInformation.length);
      });
    } else {
      print(response.message);
    }
  }

  getAllCourts() async {
    CourtInformationResponse response =
        await courtDropdownService.getAllCourts();
    if (response.success == true) {
      courtInformation.clear();
      courtInformation.addAll(response.courtInformation);

      setState(() {
        print(response.courtInformation.length);
      });
    } else {
      print(response.message);
    }
  }
}
