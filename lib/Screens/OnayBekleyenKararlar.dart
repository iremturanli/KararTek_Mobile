// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/ModalBottomOnay.dart';
import 'package:flutter_application_1/widgets/KararListCard.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../AppConfigurations/appConfigurations.dart';

import '../models/LawyerJudgmentInformation/filterDetailDtoKK.dart';
import '../models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import '../services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import 'KararOnayDetay.dart';

class OnayBekleyenKararlar extends StatefulWidget {
  const OnayBekleyenKararlar({Key? key}) : super(key: key);

  @override
  State<OnayBekleyenKararlar> createState() => _OnayBekleyenKararlarState();
}

class _OnayBekleyenKararlarState extends State<OnayBekleyenKararlar> {
  TextEditingController dateInputController = TextEditingController();
  TextEditingController dateInputControllerSecond = TextEditingController();
  TextEditingController assessmentController = TextEditingController();
  TextEditingController hukumController = TextEditingController();
  TextEditingController kararNoController = TextEditingController();
  TextEditingController kararController = TextEditingController();
  TextEditingController esasNoController = TextEditingController();
  final bool _isTap = false;
  final bool _isTapSecond = false;
  @override
  void initState() {
    getAllLawyerJudgments();
  }

  FilterDetailDtoKK filterDetailDtoKK = FilterDetailDtoKK();

  DateTime? selectedDate;
  DateTime? selectedDateSecond;

  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();

  List<LawyerJudgmentListInformation> pendingApprovalJudgments = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Onay Bekleyen Kararlar',
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
                                  child: const Text(
                                      'Onay Bekleyen Karar Sorgulama',
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

                                        Container(
                                          // height: 54,
                                          // width: 400,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white),
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
                                                        .lawyerAssesment =
                                                    assessmentController.text;
                                                filterDetailDtoKK.meritsNo =
                                                    esasNoController.text;
                                                //  getJudgmentsByFilter(
                                                //    filterDetailDtoKK);
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
                          )
                      //ModalBottomOnay(),
                      ),
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
                  itemCount: pendingApprovalJudgments.length,
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
                                builder: (context) => KararDetay(
                                      ListIndex: index,
                                      pendingApprovalJudgments:
                                          pendingApprovalJudgments,
                                    )));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardData(
                            param1: pendingApprovalJudgments[index].meritsNo,
                            param2: pendingApprovalJudgments[index].meritsYear,
                          ),
                          SizedBox(width: height / 40), //?????
                          CardData(
                            param1: pendingApprovalJudgments[index].decreeNo,
                            param2: pendingApprovalJudgments[index].decreeYear,
                          ),
                          Chip(
                            labelPadding: EdgeInsets.all(1.0),
                            label: Text(
                              pendingApprovalJudgments[index].stateName!,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 1, 28, 63),
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

  getAllLawyerJudgments() async {
    try {
      SearchDataLawyerResponse response =
          await lawyerJudgmentService.getAllLawyerJudgments();
      if (response.success == true) {
        pendingApprovalJudgments.clear();
        pendingApprovalJudgments.addAll(response.data!);
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
}
