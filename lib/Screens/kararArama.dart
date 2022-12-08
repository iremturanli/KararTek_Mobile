// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchTypeDropdownResponse.dart';
import 'package:flutter_application_1/Screens/AramaSonuclari.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentDtoInformation.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/models/SearchTypeInformation/searchTypeInformation.dart';
import 'package:flutter_application_1/services/DropDownServices/SearchTypeDropdownService.dart';
import 'package:flutter_application_1/services/JudgmentServices/judgmentService.dart';
import 'package:flutter_application_1/services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import 'package:flutter_application_1/widgets/ModalBottomDetayl%C4%B1Arama.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../AppConfigurations/appConfigurations.dart';
import '../models/EDecisionTypes.dart';

class KararArama extends StatefulWidget {
  const KararArama({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KararAramaState createState() => _KararAramaState();
}

enum YuksekYargi { yargitay, danistay, anayasaMahkemesi }

YuksekYargi? _yuksekYargi = YuksekYargi.yargitay;

class _KararAramaState extends State<KararArama> {
  final textEditingController = TextEditingController();
  bool isVisible = false;

  final SearchTypeDropdownService searchTypeDropdownService =
      getIt.get<SearchTypeDropdownService>();
  final JudgmentService judgmentService = getIt.get<JudgmentService>();
  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();

  List<SearchTypeInformation> searchTypeInformation = [];
  List<LawyerJudgmentListInformation> judgments = [];
  SearchTypeInformation? selectedOption;
  int? decisionValue;

  @override
  void initState() {
    // TODO: implement initState

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
                  controller: textEditingController,
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
                  value: selectedOption,
                  onChanged: (SearchTypeInformation? newValue) {
                    setState(() {
                      //selectedOption = newValue;
                      if (newValue!.TypeID == 2) {
                        isVisible = true;
                        selectedOption = newValue;
                      } else {
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
                      JudgmentDtoInformation judgmentDtoInformation =
                          JudgmentDtoInformation(
                              keyword: textEditingController.text,
                              searchTypeID: selectedOption!.TypeID,
                              judgmentTypeID: decisionValue);
                      if (selectedOption!.TypeID == 1) {
                        getLawyerJudgments(judgmentDtoInformation);
                      } else {
                        getJudgments(judgmentDtoInformation);
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
                    onPressed: () => showMaterialModalBottomSheet<void>(
                      expand: true,
                      // backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) => ModalBottom(
                        press: () {
                          //_runFilter(textEditingController.text);
                        },
                        searchWord: textEditingController,
                      ),
                    ),
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

        //TODO:foreach loop
        //idler aynı mı

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
}
