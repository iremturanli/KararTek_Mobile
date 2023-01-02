// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/Screens/KaydettigimKararlar.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentAddDto.dart';

import 'package:flutter_application_1/services/DropDownServices/CommissionDropdownService.dart';
import 'package:flutter_application_1/services/DropDownServices/CourtDropdownService.dart';
import 'package:flutter_application_1/services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:open_filex/open_filex.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../ApiResponse/CourtDropdownResponse.dart';
import '../AppConfigurations/appConfigurations.dart';
import '../models/CommissionInformation/commissionInformation.dart';
import '../models/CourtInformation/CourtInformation.dart';

// ignore: camel_case_types
class kararKayit extends StatefulWidget {
  const kararKayit({
    Key? key,
  }) : super(key: key);

  @override
  State<kararKayit> createState() => _kararKayitState();
}

// ignore: camel_case_types
class _kararKayitState extends State<kararKayit> {
  final CommissionDropdownService commissionDropdownService =
      getIt.get<CommissionDropdownService>();
  final CourtDropdownService courtDropdownService =
      getIt.get<CourtDropdownService>();
  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();

  late List<String> docPaths;
  int? lookCourt;
  CommissionInformation? selectedCommission;
  List<CommissionInformation> commissionInformation = [];
  LawyerJudgmentAddDto lawyerJudgmentInformation = LawyerJudgmentAddDto();
  CourtInformation? selectedCourt;
  DateTime? selectedDate;
  List<CourtInformation> courtInformation = [];
  TextEditingController dateInputController = TextEditingController();
  TextEditingController assessmentController = TextEditingController();
  TextEditingController decreeTypeController = TextEditingController();
  TextEditingController hukumController = TextEditingController();
  TextEditingController esasNoController = TextEditingController();
  TextEditingController esasYearController = TextEditingController();
  TextEditingController kararNoController = TextEditingController();
  TextEditingController kararYearController = TextEditingController();
  TextEditingController kararController = TextEditingController();

  @override
  void initState() {
    dateInputController.text = "";
    super.initState();
    getCommissions();
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '##-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final bool _isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Karar Kayıt',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 30),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            const Text('Daire/Kurul Adı'),
            Container(
              height: 45,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: DropdownButtonFormField<CommissionInformation>(
                isExpanded: true,
                //underline: SizedBox.shrink(),
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                dropdownColor: Colors.white,
                value: selectedCommission,
                onChanged: (CommissionInformation? newValue) {
                  setState(() {
                    selectedCommission = newValue;
                    lookCourt = selectedCommission!.CommissionID;
                    print(selectedCommission!.CommissionID.toString());
                  });
                  selectedCourt = null;
                  getCourts(lookCourt);
                  //selectedCommission = null;
                },

                validator: (value) =>
                    value == null ? "Bu alan boş bırakılamaz" : null,
                items: commissionInformation
                    .map((CommissionInformation commissionInformation) {
                  return DropdownMenuItem<CommissionInformation>(
                    value: commissionInformation,
                    child: Text(
                      commissionInformation.CommissionName!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            const Text('Mahkeme'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            Container(
              height: 45,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: DropdownButtonFormField<CourtInformation>(
                isExpanded: true,
                //underline: SizedBox.shrink(),
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                dropdownColor: Colors.white,
                value: selectedCourt,
                onChanged: (CourtInformation? newValue) {
                  setState(() {
                    selectedCourt = newValue;
                    print(selectedCourt!.CourtID.toString());
                  });
                },

                validator: (value) =>
                    value == null ? "Bu alan boş bırakılamaz" : null,
                items:
                    courtInformation.map((CourtInformation courtInformation) {
                  return DropdownMenuItem<CourtInformation>(
                    value: courtInformation,
                    child: Text(
                      courtInformation.CourtName!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            const Text('Hüküm'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextFormField(
              controller: hukumController,
              textAlignVertical: TextAlignVertical.top,
              minLines: 3,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(246, 246, 246, 246),
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
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            const Text('Avukat Değerlendirmesi'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextFormField(
              controller: assessmentController,
              textAlignVertical: TextAlignVertical.top,
              minLines: 3,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(246, 246, 246, 246),
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
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            const Text('Dava Türü'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextFormField(
              controller: decreeTypeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(246, 246, 246, 246),
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
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            const Text('Esas No'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            Row(children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                  child: TextFormField(
                    controller: esasYearController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(246, 246, 246, 246),
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
                        hintText: 'Esas Yılı',
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 50),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                  child: TextFormField(
                    controller: esasNoController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(246, 246, 246, 246),
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
                        hintText: 'Esas No',
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
              )
            ]),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            const Text('Karar No'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            Row(children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                  child: TextFormField(
                    controller: kararYearController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(246, 246, 246, 246),
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
                        hintText: 'Karar Yılı',
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 50),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                  child: TextFormField(
                    controller: kararNoController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(246, 246, 246, 246),
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
                        hintText: 'Karar No',
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
              )
            ]),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            const Text('Karar Tarihi'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextFormField(
              controller: dateInputController,
              keyboardType: TextInputType.datetime,
              inputFormatters: [maskFormatter],
              //editing controller of this TextField
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today,
                      color: _isTap ? Colors.grey : Colors.black),
                  prefixIconColor: Colors.grey,
                  filled: true,
                  fillColor: const Color.fromARGB(246, 246, 246, 246),
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
                  hintText: '__-__-____',
                  hintStyle:
                      const TextStyle(color: Colors.grey) //icon of text field
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
                            primary:
                                HexColor('#5DB075'), // header background color
                            onPrimary: Colors.white, // header text color
                            onSurface: const Color.fromARGB(
                                255, 20, 20, 20), // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: const Color.fromARGB(
                                  255, 23, 48, 112), // button text color
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

                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    selectedDate = pickedDate;
                    dateInputController.text =
                        DateFormat("dd-MM-yyyy").format(pickedDate);
                  });
                }
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            const Text('Karar'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextFormField(
              controller: kararController,
              textAlignVertical: TextAlignVertical.top,
              minLines: 3,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(246, 246, 246, 246),
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
            // SizedBox(height: MediaQuery.of(context).size.height / 35),
            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       minimumSize: const Size(150, 45),
            //       backgroundColor: const Color.fromARGB(255, 1, 28, 63)),
            //   onPressed: () {
            //     pickFiles();
            //   },
            //   icon: const Icon(Icons.file_copy),
            //   label: const Text(
            //     'Yeni Dosya Yükle',
            //     style: TextStyle(fontSize: 17),
            //   ),
            // ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(150, 45),
                  backgroundColor: HexColor('#5DB075')),
              onPressed: () {
                lawyerJudgmentInformation.commissionId =
                    selectedCommission!.CommissionID;
                lawyerJudgmentInformation.courtId = selectedCourt!.CourtID;
                lawyerJudgmentInformation.decree = hukumController.text;
                lawyerJudgmentInformation.lawyerAssessment =
                    assessmentController.text;
                lawyerJudgmentInformation.decreeType =
                    decreeTypeController.text;
                lawyerJudgmentInformation.meritsYear = esasYearController.text;
                lawyerJudgmentInformation.meritsNo = esasNoController.text;
                lawyerJudgmentInformation.decreeYear = kararYearController.text;
                lawyerJudgmentInformation.decreeNo = kararNoController.text;
                lawyerJudgmentInformation.decision = kararController.text;
                lawyerJudgmentInformation.judgmentDate = selectedDate;
                addLawyerJudgment(lawyerJudgmentInformation);
              },
              icon: const Icon(Icons.save),
              label: const Text(
                'Kaydet',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
          ],
        ),
      ),
    );
  }

  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    PlatformFile file = result.files.first;
    viewFile(file);

    // FileUploadInputElement uploadInput = FileUploadInputElement();
  }

  void viewFile(file) {
    OpenFilex.open(file.path);
  }

  addLawyerJudgment(LawyerJudgmentAddDto lawyerJudgmentAddDto) async {
    try {
      MobileApiResponse response =
          await lawyerJudgmentService.addLawyerJudgment(lawyerJudgmentAddDto);
      if (response.hasError == false) {
        setState(() {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const KaydettigimKararlar()));
        });

        print(response);
      } else {
        print(response.hasError);
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
}
