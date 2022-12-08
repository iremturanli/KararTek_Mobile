// ignore: file_names
// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/KararListCard.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../ApiResponse/JudgmentStateDropdownResponse.dart';
import '../ApiResponse/SearchDataLawyerResponse.dart';
import '../AppConfigurations/appConfigurations.dart';

import '../models/JudgmentStateInformation/judgmentStateInformation.dart';
import '../models/LawyerJudgmentInformation/filterDetailDtoKK.dart';
import '../models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import '../services/DropDownServices/LawyerJudgmentStateDropdownService.dart';
import '../services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import 'kaydettigimKararlarDetay.dart';

class KaydettigimKararlar extends StatefulWidget {
  const KaydettigimKararlar({Key? key}) : super(key: key);

  @override
  State<KaydettigimKararlar> createState() => _KaydettigimKararlarState();
}

class _KaydettigimKararlarState extends State<KaydettigimKararlar> {
  TextEditingController dateInputController = TextEditingController();
  TextEditingController dateInputControllerSecond = TextEditingController();
  TextEditingController assessmentController = TextEditingController();
  TextEditingController hukumController = TextEditingController();
  TextEditingController kararNoController = TextEditingController();
  TextEditingController kararController = TextEditingController();
  TextEditingController esasNoController = TextEditingController();

  List<JudgmentStateInformation> judgmentStateInformation = [];
  final LawyerJudgmentStateDropdownService lawyerJudgmentStateDropdownService =
      getIt.get<LawyerJudgmentStateDropdownService>();

  final bool _isTap = false;
  final bool _isTapSecond = false;
  @override
  void initState() {
    super.initState();

    getLawyerJudgmentsByUserId();
    getJudgmentStates();
  }

  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();

  FilterDetailDtoKK filterDetailDtoKK = FilterDetailDtoKK();
  JudgmentStateInformation? selectedOption;
  DateTime? selectedDate;
  DateTime? selectedDateSecond;

  void Function()? onClick;

  List<LawyerJudgmentListInformation> savedJudgments = [];

  List<LawyerJudgmentListInformation> filteredJudgments = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Kaydettiğim Kararlar',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.visible),
          ),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: height / 3.2),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.search),
                  label: Text("Sorgula"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      minimumSize: Size(45, 30),
                      backgroundColor: const Color.fromARGB(255, 1, 28, 63)),
                  onPressed: () => showMaterialModalBottomSheet<void>(
                      expand: true,
                      // backgroundColor: Colors.transparent,

                      context: context,
                      builder: (BuildContext context) => Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: (MediaQuery.of(context).size.height /
                                        15)),
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  child: const Text('Kullanıcı Karar Sorgulama',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height / 8,
                                    right:
                                        MediaQuery.of(context).size.width / 25,
                                    left:
                                        MediaQuery.of(context).size.width / 25,
                                  ),
                                  child: Form(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          'Esas Numarası',
                                        ),

                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          child: TextFormField(
                                            controller: esasNoController,
                                            // ignore: prefer_const_constructors
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // ignore: prefer_const_constructors
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      255, 189, 189, 189),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        const Text('Karar Numarası'),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          child: TextFormField(
                                            controller: kararNoController,
                                            // ignore: prefer_const_constructors
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // ignore: prefer_const_constructors
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      255, 189, 189, 189),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        const Text('Karar'),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          child: TextFormField(
                                            controller: kararController,
                                            // ignore: prefer_const_constructors
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // ignore: prefer_const_constructors
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      255, 189, 189, 189),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        const Text('Hüküm'),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          child: TextFormField(
                                            controller: hukumController,
                                            // ignore: prefer_const_constructors
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // ignore: prefer_const_constructors
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      255, 189, 189, 189),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        const Text('Avukat Değerlendirmesi'),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          child: TextFormField(
                                            controller: assessmentController,
                                            // ignore: prefer_const_constructors
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // ignore: prefer_const_constructors
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      255, 189, 189, 189),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        const Text('Karar Durumu'),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
                                        ),
                                        Container(
                                          // height: 54,
                                          // width: 400,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white),
                                          child: DropdownButtonFormField<
                                              JudgmentStateInformation>(
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        60),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),

                                                // ignore: prefer_const_constructors
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                            isExpanded: true,
                                            //underline: SizedBox.shrink(),
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            dropdownColor: Colors.white,
                                            value: selectedOption,
                                            onChanged:
                                                (JudgmentStateInformation?
                                                    newValue) {
                                              setState(() {
                                                selectedOption = newValue;

                                                print(selectedOption!.StateId
                                                    .toString());
                                              });
                                            },

                                            validator: (value) => value == null
                                                ? "Bu alan boş bırakılamaz"
                                                : null,
                                            items: judgmentStateInformation.map(
                                                (JudgmentStateInformation
                                                    judgmentStateInformation) {
                                              return DropdownMenuItem<
                                                  JudgmentStateInformation>(
                                                value: judgmentStateInformation,
                                                child: Text(
                                                  judgmentStateInformation
                                                      .StateName!,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
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
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20,
                                                child: TextFormField(
                                                  controller:
                                                      dateInputController,
                                                  //editing controller of this TextField
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                          Icons.calendar_today,
                                                          color: _isTap
                                                              ? Colors.grey
                                                              : Colors.black),
                                                      prefixIconColor: Colors
                                                          .grey,
                                                      filled: true,
                                                      fillColor:
                                                          const Color.fromARGB(
                                                              246,
                                                              246,
                                                              246,
                                                              246),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          8))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        // ignore: prefer_const_constructors
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              189, 189, 189),
                                                        ),
                                                      ),
                                                      hintText: '__/__/____',
                                                      hintStyle: const TextStyle(
                                                          color: Colors
                                                              .grey) //icon of text field
                                                      //labelText: "" //label text of field
                                                      ),

                                                  //set it true, so that user will not able to edit text
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            locale:
                                                                const Locale(
                                                                    "tr", "TR"),
                                                            builder:
                                                                (BuildContext
                                                                        context,
                                                                    child) {
                                                              return Theme(
                                                                data: Theme.of(
                                                                        context)
                                                                    .copyWith(
                                                                  colorScheme:
                                                                      ColorScheme
                                                                          .light(
                                                                    primary:
                                                                        HexColor(
                                                                            '#5DB075'), // header background color
                                                                    onPrimary:
                                                                        Colors
                                                                            .white, // header text color
                                                                    onSurface: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        20,
                                                                        20,
                                                                        20), // body text color
                                                                  ),
                                                                  textButtonTheme:
                                                                      TextButtonThemeData(
                                                                    style: TextButton
                                                                        .styleFrom(
                                                                      foregroundColor: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          23,
                                                                          48,
                                                                          112), // button text color
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: child!,
                                                              );
                                                            },
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1881),
                                                            //DateTime.now() - not to allow to choose before today.
                                                            lastDate:
                                                                DateTime(2100));

                                                    if (pickedDate != null &&
                                                        pickedDate !=
                                                            selectedDate) {
                                                      setState(() {
                                                        selectedDate =
                                                            pickedDate;
                                                        dateInputController
                                                            .text = DateFormat(
                                                                "dd-MM-yyyy")
                                                            .format(pickedDate);
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50),
                                            Expanded(
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20,
                                                child: TextFormField(
                                                  controller:
                                                      dateInputControllerSecond,
                                                  //editing controller of this TextField
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                          Icons.calendar_today,
                                                          color: _isTapSecond
                                                              ? Colors.grey
                                                              : Colors.black),
                                                      prefixIconColor: Colors
                                                          .grey,
                                                      filled: true,
                                                      fillColor:
                                                          const Color.fromARGB(
                                                              246,
                                                              246,
                                                              246,
                                                              246),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          8))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        // ignore: prefer_const_constructors
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              189, 189, 189),
                                                        ),
                                                      ),
                                                      hintText: '__/__/____',
                                                      hintStyle: const TextStyle(
                                                          color: Colors
                                                              .grey) //icon of text field
                                                      //labelText: "" //label text of field
                                                      ),

                                                  //set it true, so that user will not able to edit text
                                                  onTap: () async {
                                                    DateTime? pickedDateSecond =
                                                        await showDatePicker(
                                                            locale:
                                                                const Locale(
                                                                    "tr", "TR"),
                                                            builder:
                                                                (BuildContext
                                                                        context,
                                                                    child) {
                                                              return Theme(
                                                                data: Theme.of(
                                                                        context)
                                                                    .copyWith(
                                                                  colorScheme:
                                                                      ColorScheme
                                                                          .light(
                                                                    primary:
                                                                        HexColor(
                                                                            '#5DB075'), // header background color
                                                                    onPrimary:
                                                                        Colors
                                                                            .white, // header text color
                                                                    onSurface: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        20,
                                                                        20,
                                                                        20), // body text color
                                                                  ),
                                                                  textButtonTheme:
                                                                      TextButtonThemeData(
                                                                    style: TextButton
                                                                        .styleFrom(
                                                                      foregroundColor: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          23,
                                                                          48,
                                                                          112), // button text color
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: child!,
                                                              );
                                                            },
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1881),
                                                            //DateTime.now() - not to allow to choose before today.
                                                            lastDate:
                                                                DateTime(2100));

                                                    if (pickedDateSecond !=
                                                            null &&
                                                        pickedDateSecond !=
                                                            selectedDateSecond) {
                                                      setState(() {
                                                        selectedDateSecond =
                                                            pickedDateSecond;
                                                        dateInputControllerSecond
                                                            .text = DateFormat(
                                                                "dd-MM-yyyy")
                                                            .format(
                                                                pickedDateSecond);
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
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  minimumSize:
                                                      const Size(150, 45),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 194, 27, 5)),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Vazgeç',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  minimumSize:
                                                      const Size(150, 45),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 1, 28, 63)),
                                              onPressed: (() {
                                                filterDetailDtoKK.decision =
                                                    kararController.text;
                                                filterDetailDtoKK.decree =
                                                    hukumController.text;
                                                filterDetailDtoKK.decreeNo =
                                                    kararNoController.text;
                                                filterDetailDtoKK.finishDate =
                                                    selectedDateSecond;
                                                filterDetailDtoKK.startDate =
                                                    selectedDate;
                                                filterDetailDtoKK
                                                        .judgmentStateId =
                                                    selectedOption?.StateId;
                                                filterDetailDtoKK
                                                        .lawyerAssesment =
                                                    assessmentController.text;
                                                filterDetailDtoKK.meritsNo =
                                                    esasNoController.text;
                                                getJudgmentsByFilter(
                                                    filterDetailDtoKK);
                                              }),
                                              child: const Text(
                                                'Sorgula',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text("Esas No"),
                  Text("Karar No"),
                  Text("Karar Durumu"),
                ],
              ),
              CustomDivider(),
              SizedBox(
                //container
                height: height / 2,
                width: width,
                child: ListView.builder(
                  //<-- SEE HERE
                  itemCount: savedJudgments.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 4,
                    color: const Color.fromARGB(229, 229, 229, 229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KaydettigimKararDetay(
                                      ListIndex: index,
                                      savedJudgments: savedJudgments,
                                    )));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardData(
                            param1: savedJudgments[index].meritsNo,
                            param2: savedJudgments[index].meritsYear,
                          ),
                          SizedBox(width: height / 40), //?????
                          CardData(
                            param1: savedJudgments[index].decreeNo,
                            param2: savedJudgments[index].decreeYear,
                          ),
                          Chip(
                            labelPadding: EdgeInsets.all(2.0),
                            label: Text(
                              savedJudgments[index].stateName!,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: statusColor(index),
                            elevation: 6.0,
                            shadowColor: Colors.grey[60],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  statusColor(int index) {
    if (savedJudgments[index].stateId == 4) {
      return Color.fromARGB(255, 130, 184, 113);
    } else if (savedJudgments[index].stateId == 3) {
      return Color.fromARGB(255, 194, 27, 5);
    } else {
      return const Color.fromARGB(255, 1, 28, 63);
    }
  }

  getLawyerJudgmentsByUserId() async {
    try {
      SearchDataLawyerResponse response =
          await lawyerJudgmentService.getLawyerJudgmentByUserId();
      if (response.success == true) {
        savedJudgments.clear();
        savedJudgments.addAll(response.data!);
        print(response.success);
        setState(() {});

        print(response);
      } else {
        print(response.message);
      }
    } catch (e) {
      print(e);
    }
  }

  getJudgmentsByFilter(FilterDetailDtoKK filterDetailDtoKK) async {
    try {
      SearchDataLawyerResponse response = await lawyerJudgmentService
          .getLawyerJudgmentsByFilter(filterDetailDtoKK);
      if (response.success == true) {
        savedJudgments.clear();
        savedJudgments.addAll(response.data!);
        setState(() {
          Navigator.of(context).pop();
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const KaydettigimKararlar()));
        });

        print(response);
      } else {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  getJudgmentStates() async {
    JudgmentStateDropdownResponse response =
        await lawyerJudgmentStateDropdownService.getJudgmentState();
    if (response.hasError == false) {
      judgmentStateInformation.addAll(response.judgmentStateInformation);

      setState(() {
        print("success");
      });
    } else {
      print(response.errorMessage);
    }
  }

  // ignore: non_constant_identifier_names
//   ModalBottomOnayWidget() {
//     @override
//     Widget build(BuildContext context) {
//       return Stack(
//         children: <Widget>[
//           Padding(
//             padding:
//                 EdgeInsets.only(top: (MediaQuery.of(context).size.height / 15)),
//             child: Container(
//               alignment: Alignment.topCenter,
//               child: const Text('Kullanıcı Karar Sorgulama',
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//             ),
//           ),
//           Padding(
//               padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).size.height / 8,
//                 right: MediaQuery.of(context).size.width / 25,
//                 left: MediaQuery.of(context).size.width / 25,
//               ),
//               child: Form(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     const Text(
//                       'Esas Numarası',
//                     ),

//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 20,
//                       child: TextFormField(
//                         controller: esasNoController,
//                         // ignore: prefer_const_constructors
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color.fromARGB(255, 255, 255, 255),
//                           focusedBorder: const OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8))),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // ignore: prefer_const_constructors
//                             borderSide: BorderSide(
//                               width: 1,
//                               color: const Color.fromARGB(255, 189, 189, 189),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     // ignore: prefer_const_constructors
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                     const Text('Karar Numarası'),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 20,
//                       child: TextFormField(
//                         controller: kararNoController,
//                         // ignore: prefer_const_constructors
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color.fromARGB(255, 255, 255, 255),
//                           focusedBorder: const OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8))),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // ignore: prefer_const_constructors
//                             borderSide: BorderSide(
//                               width: 1,
//                               color: const Color.fromARGB(255, 189, 189, 189),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                     const Text('Karar'),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 20,
//                       child: TextFormField(
//                         controller: kararController,
//                         // ignore: prefer_const_constructors
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color.fromARGB(255, 255, 255, 255),
//                           focusedBorder: const OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8))),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // ignore: prefer_const_constructors
//                             borderSide: BorderSide(
//                               width: 1,
//                               color: const Color.fromARGB(255, 189, 189, 189),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                     const Text('Hüküm'),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 20,
//                       child: TextFormField(
//                         controller: hukumController,
//                         // ignore: prefer_const_constructors
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color.fromARGB(255, 255, 255, 255),
//                           focusedBorder: const OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8))),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // ignore: prefer_const_constructors
//                             borderSide: BorderSide(
//                               width: 1,
//                               color: const Color.fromARGB(255, 189, 189, 189),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                     const Text('Avukat Değerlendirmesi'),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 20,
//                       child: TextFormField(
//                         controller: assessmentController,
//                         // ignore: prefer_const_constructors
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color.fromARGB(255, 255, 255, 255),
//                           focusedBorder: const OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8))),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // ignore: prefer_const_constructors
//                             borderSide: BorderSide(
//                               width: 1,
//                               color: const Color.fromARGB(255, 189, 189, 189),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                     const Text('Karar Durumu'),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),
//                     Container(
//                       height: 45,
//                       width: 330,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white),
//                       child:
//                           // ignore: unnecessary_new
//                           new DropdownButtonFormField<JudgmentStateInformation>(
//                         isExpanded: true,
//                         //underline: SizedBox.shrink(),
//                         icon: const Icon(Icons.keyboard_arrow_down_outlined),
//                         dropdownColor: Colors.white,
//                         value: selectedOption,
//                         onChanged: (JudgmentStateInformation? newValue) {
//                           setState(() {
//                             selectedOption = newValue;

//                             print(selectedOption!.StateId.toString());
//                           });
//                         },

//                         validator: (value) =>
//                             value == null ? "Bu alan boş bırakılamaz" : null,
//                         items: judgmentStateInformation.map(
//                             (JudgmentStateInformation
//                                 judgmentStateInformation) {
//                           return DropdownMenuItem<JudgmentStateInformation>(
//                             value: judgmentStateInformation,
//                             child: Text(
//                               judgmentStateInformation.StateName!,
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                     const Text('Karar Aralığı'),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),

//                     Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: SizedBox(
//                             height: MediaQuery.of(context).size.height / 20,
//                             child: TextFormField(
//                               controller: dateInputController,
//                               //editing controller of this TextField
//                               decoration: InputDecoration(
//                                   prefixIcon: Icon(Icons.calendar_today,
//                                       color:
//                                           _isTap ? Colors.grey : Colors.black),
//                                   prefixIconColor: Colors.grey,
//                                   filled: true,
//                                   fillColor:
//                                       const Color.fromARGB(246, 246, 246, 246),
//                                   focusedBorder: const OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(8))),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     // ignore: prefer_const_constructors
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: const Color.fromARGB(
//                                           255, 189, 189, 189),
//                                     ),
//                                   ),
//                                   hintText: '__/__/____',
//                                   hintStyle: const TextStyle(
//                                       color: Colors.grey) //icon of text field
//                                   //labelText: "" //label text of field
//                                   ),

//                               //set it true, so that user will not able to edit text
//                               onTap: () async {
//                                 DateTime? pickedDate = await showDatePicker(
//                                     locale: const Locale("tr", "TR"),
//                                     builder: (BuildContext context, child) {
//                                       return Theme(
//                                         data: Theme.of(context).copyWith(
//                                           colorScheme: ColorScheme.light(
//                                             primary: HexColor(
//                                                 '#5DB075'), // header background color
//                                             onPrimary: Colors
//                                                 .white, // header text color
//                                             onSurface: const Color.fromARGB(255,
//                                                 20, 20, 20), // body text color
//                                           ),
//                                           textButtonTheme: TextButtonThemeData(
//                                             style: TextButton.styleFrom(
//                                               foregroundColor:
//                                                   const Color.fromARGB(
//                                                       255,
//                                                       23,
//                                                       48,
//                                                       112), // button text color
//                                             ),
//                                           ),
//                                         ),
//                                         child: child!,
//                                       );
//                                     },
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime(1881),
//                                     //DateTime.now() - not to allow to choose before today.
//                                     lastDate: DateTime(2100));

//                                 if (pickedDate != null &&
//                                     pickedDate != selectedDate) {
//                                   setState(() {
//                                     selectedDate = pickedDate;
//                                     dateInputController?.text =
//                                         DateFormat("dd-MM-yyyy")
//                                             .format(pickedDate);
//                                   });
//                                 }
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                             width: MediaQuery.of(context).size.height / 50),
//                         Expanded(
//                           child: SizedBox(
//                             height: MediaQuery.of(context).size.height / 20,
//                             child: TextFormField(
//                               controller: dateInputControllerSecond,
//                               //editing controller of this TextField
//                               decoration: InputDecoration(
//                                   prefixIcon: Icon(Icons.calendar_today,
//                                       color: _isTapSecond
//                                           ? Colors.grey
//                                           : Colors.black),
//                                   prefixIconColor: Colors.grey,
//                                   filled: true,
//                                   fillColor:
//                                       const Color.fromARGB(246, 246, 246, 246),
//                                   focusedBorder: const OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(8))),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     // ignore: prefer_const_constructors
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: const Color.fromARGB(
//                                           255, 189, 189, 189),
//                                     ),
//                                   ),
//                                   hintText: '__/__/____',
//                                   hintStyle: const TextStyle(
//                                       color: Colors.grey) //icon of text field
//                                   //labelText: "" //label text of field
//                                   ),

//                               //set it true, so that user will not able to edit text
//                               onTap: () async {
//                                 DateTime? pickedDateSecond = await showDatePicker(
//                                     locale: const Locale("tr", "TR"),
//                                     builder: (BuildContext context, child) {
//                                       return Theme(
//                                         data: Theme.of(context).copyWith(
//                                           colorScheme: ColorScheme.light(
//                                             primary: HexColor(
//                                                 '#5DB075'), // header background color
//                                             onPrimary: Colors
//                                                 .white, // header text color
//                                             onSurface: const Color.fromARGB(255,
//                                                 20, 20, 20), // body text color
//                                           ),
//                                           textButtonTheme: TextButtonThemeData(
//                                             style: TextButton.styleFrom(
//                                               foregroundColor:
//                                                   const Color.fromARGB(
//                                                       255,
//                                                       23,
//                                                       48,
//                                                       112), // button text color
//                                             ),
//                                           ),
//                                         ),
//                                         child: child!,
//                                       );
//                                     },
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime(1881),
//                                     //DateTime.now() - not to allow to choose before today.
//                                     lastDate: DateTime(2100));

//                                 if (pickedDateSecond != null &&
//                                     pickedDateSecond != selectedDateSecond) {
//                                   setState(() {
//                                     selectedDateSecond = pickedDateSecond;
//                                     dateInputControllerSecond?.text =
//                                         DateFormat("dd-MM-yyyy")
//                                             .format(pickedDateSecond);
//                                   });
//                                 }
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height / 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               minimumSize: const Size(150, 45),
//                               backgroundColor:
//                                   const Color.fromARGB(255, 194, 27, 5)),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             'Vazgeç',
//                             style: TextStyle(fontSize: 17),
//                           ),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               minimumSize: const Size(150, 45),
//                               backgroundColor:
//                                   const Color.fromARGB(255, 1, 28, 63)),
//                           onPressed: (() {
//                             filterDetailDtoKK.decision = kararController?.text;
//                             filterDetailDtoKK.decree = hukumController?.text;
//                             filterDetailDtoKK.decreeNo =
//                                 kararNoController?.text;
//                             filterDetailDtoKK.finishDate = selectedDateSecond;
//                             filterDetailDtoKK.startDate = selectedDate;
//                             filterDetailDtoKK.judgmentStateId =
//                                 selectedOption?.StateId;
//                             filterDetailDtoKK.lawyerAssesment =
//                                 assessmentController?.text;
//                             filterDetailDtoKK.meritsNo = esasNoController?.text;
//                             getJudgmentsByFilter(filterDetailDtoKK);
//                           }),
//                           child: const Text(
//                             'Sorgula',
//                             style: TextStyle(fontSize: 17),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )),
//         ],
//       );
//     }
//   }
// }
//Color.fromARGB(255, 194, 27, 5)
// Color.fromARGB(255, 130, 184, 113)
}
