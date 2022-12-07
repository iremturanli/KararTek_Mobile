// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/JudgmentStateDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/models/JudgmentStateInformation/judgmentStateInformation.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/filterDetailDtoKK.dart';
import 'package:flutter_application_1/services/DropDownServices/LawyerJudgmentStateDropdownService.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../AppConfigurations/appConfigurations.dart';

import '../models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import '../services/LawyerJudgmentServices/LawyerJudgmentService.dart';

class ModalBottomOnay extends StatefulWidget {
  final JudgmentStateInformation? selectedOption;
  final TextEditingController? dateInputController;
  final TextEditingController? dateInputControllerSecond;
  final TextEditingController? assessmentController;
  final TextEditingController? hukumController;
  final TextEditingController? kararNoController;
  final TextEditingController? kararController;
  final TextEditingController? esasNoController;

  DateTime? selectedDate;
  DateTime? selectedDateSecond;

  final void Function()? onClick;
  ModalBottomOnay(
      {Key? key,
      required this.dateInputController,
      required this.dateInputControllerSecond,
      required this.assessmentController,
      required this.hukumController,
      required this.kararNoController,
      required this.kararController,
      required this.esasNoController,
      this.onClick,
      this.selectedOption,
      this.selectedDate,
      this.selectedDateSecond})
      : super(key: key);

  @override
  State<ModalBottomOnay> createState() => _ModalBottomOnayState();
}

class _ModalBottomOnayState extends State<ModalBottomOnay> {
  List<LawyerJudgmentListInformation> savedJudgments = [];
  @override
  void initState() {
    super.initState();

    getJudgmentStates();
  }

  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();

  FilterDetailDtoKK filterDetailDtoKK = FilterDetailDtoKK();

  final bool _isTap = false;
  final bool _isTapSecond = false;
  List<JudgmentStateInformation> judgmentStateInformation = [];
  final LawyerJudgmentStateDropdownService lawyerJudgmentStateDropdownService =
      getIt.get<LawyerJudgmentStateDropdownService>();

  JudgmentStateInformation? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height / 15)),
          child: Container(
            alignment: Alignment.topCenter,
            child: const Text('Kullanıcı Karar Sorgulama',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 8,
              right: MediaQuery.of(context).size.width / 25,
              left: MediaQuery.of(context).size.width / 25,
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Esas Numarası',
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      controller: widget.esasNoController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Karar Numarası'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      controller: widget.kararNoController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Karar'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      controller: widget.kararController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Hüküm'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      controller: widget.hukumController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Avukat Değerlendirmesi'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      controller: widget.assessmentController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Karar Durumu'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  Container(
                    height: 45,
                    width: 330,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child:
                        // ignore: unnecessary_new
                        new DropdownButtonFormField<JudgmentStateInformation>(
                      isExpanded: true,
                      //underline: SizedBox.shrink(),
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      dropdownColor: Colors.white,
                      value: selectedOption,
                      onChanged: (JudgmentStateInformation? newValue) {
                        setState(() {
                          selectedOption = newValue;

                          print(selectedOption!.StateId.toString());
                        });
                      },

                      validator: (value) =>
                          value == null ? "Bu alan boş bırakılamaz" : null,
                      items: judgmentStateInformation.map(
                          (JudgmentStateInformation judgmentStateInformation) {
                        return DropdownMenuItem<JudgmentStateInformation>(
                          value: judgmentStateInformation,
                          child: Text(
                            judgmentStateInformation.StateName!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Karar Aralığı'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextFormField(
                            controller: widget.dateInputController,
                            //editing controller of this TextField
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today,
                                    color: _isTap ? Colors.grey : Colors.black),
                                prefixIconColor: Colors.grey,
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(246, 246, 246, 246),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // ignore: prefer_const_constructors
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 189, 189, 189),
                                  ),
                                ),
                                hintText: '__/__/____',
                                hintStyle: const TextStyle(
                                    color: Colors.grey) //icon of text field
                                //labelText: "" //label text of field
                                ),

                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  locale: const Locale("tr", "TR"),
                                  builder: (BuildContext context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: HexColor(
                                              '#5DB075'), // header background color
                                          onPrimary:
                                              Colors.white, // header text color
                                          onSurface: const Color.fromARGB(255,
                                              20, 20, 20), // body text color
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                const Color.fromARGB(
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
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1881),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null &&
                                  pickedDate != widget.selectedDate) {
                                setState(() {
                                  widget.selectedDate = pickedDate;
                                  widget.dateInputController?.text =
                                      DateFormat("dd-MM-yyyy")
                                          .format(pickedDate);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.height / 50),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextFormField(
                            controller: widget.dateInputControllerSecond,
                            //editing controller of this TextField
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today,
                                    color: _isTapSecond
                                        ? Colors.grey
                                        : Colors.black),
                                prefixIconColor: Colors.grey,
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(246, 246, 246, 246),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // ignore: prefer_const_constructors
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 189, 189, 189),
                                  ),
                                ),
                                hintText: '__/__/____',
                                hintStyle: const TextStyle(
                                    color: Colors.grey) //icon of text field
                                //labelText: "" //label text of field
                                ),

                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDateSecond = await showDatePicker(
                                  locale: const Locale("tr", "TR"),
                                  builder: (BuildContext context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: HexColor(
                                              '#5DB075'), // header background color
                                          onPrimary:
                                              Colors.white, // header text color
                                          onSurface: const Color.fromARGB(255,
                                              20, 20, 20), // body text color
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                const Color.fromARGB(
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
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1881),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDateSecond != null &&
                                  pickedDateSecond !=
                                      widget.selectedDateSecond) {
                                setState(() {
                                  widget.selectedDateSecond = pickedDateSecond;
                                  widget.dateInputControllerSecond?.text =
                                      DateFormat("dd-MM-yyyy")
                                          .format(pickedDateSecond);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(150, 45),
                            backgroundColor:
                                const Color.fromARGB(255, 194, 27, 5)),
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
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(150, 45),
                            backgroundColor:
                                const Color.fromARGB(255, 1, 28, 63)),
                        onPressed: (() {}),
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
    );
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
}
