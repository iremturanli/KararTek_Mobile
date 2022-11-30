// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/CommissionDropdownResponse.dart';
import 'package:flutter_application_1/ApiResponse/CourtDropdownResponse.dart';
import 'package:flutter_application_1/models/CourtInformation/CourtInformation.dart';
import 'package:flutter_application_1/services/DropDownServices/CommissionDropdownService.dart';
import 'package:flutter_application_1/services/DropDownServices/CourtDropdownService.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../AppConfigurations/appConfigurations.dart';
import '../models/CommissionInformation/commissionInformation.dart';

// ignore: camel_case_types
class kararKayit extends StatefulWidget {
  const kararKayit({
    Key? key,
  }) : super(key: key);

  @override
  State<kararKayit> createState() => _kararKayitState();
}

class _kararKayitState extends State<kararKayit> {
  final CommissionDropdownService commissionDropdownService =
      getIt.get<CommissionDropdownService>();
  final CourtDropdownService courtDropdownService =
      getIt.get<CourtDropdownService>();

  late List<String> docPaths;
  int? lookCourt;
  CommissionInformation? selectedCommission;
  List<CommissionInformation> commissionInformation = [];

  CourtInformation? selectedCourt;
  List<CourtInformation> courtInformation = [];

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
    getCommissions();
    getCourts();
  }

  final bool _isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Karar Kayıt',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 30),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            Text('Daire/Kurul Adı*'),
            Container(
              height: 45,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: DropdownButtonFormField<CommissionInformation>(
                isExpanded: true,
                //underline: SizedBox.shrink(),
                icon: Icon(Icons.keyboard_arrow_down_outlined),
                dropdownColor: Colors.white,
                value: selectedCommission,
                onChanged: (CommissionInformation? newValue) {
                  setState(() {
                    selectedCommission = newValue;
                    lookCourt = selectedCommission!.CommissionID;
                    print(selectedCommission!.CommissionID.toString());
                  });
                },

                validator: (value) =>
                    value == null ? "Bu alan boş bırakılamaz" : null,
                items: commissionInformation
                    .map((CommissionInformation commissionInformation) {
                  return DropdownMenuItem<CommissionInformation>(
                    value: commissionInformation,
                    child: Text(
                      commissionInformation.CommissionName!,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Text('Mahkeme'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            Container(
              height: 45,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: DropdownButtonFormField<CourtInformation>(
                isExpanded: true,
                //underline: SizedBox.shrink(),
                icon: Icon(Icons.keyboard_arrow_down_outlined),
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
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Text('Avukat Değerlendirmesi*'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextFormField(
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
            Text('Dava Türü'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextFormField(
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
            Text('Esas No'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            Row(children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                  child: TextFormField(
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
                        hintText: 'Esas No*',
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
              )
            ]),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Text('Karar No'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            Row(children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                  child: TextFormField(
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
            Text('Karar Tarihi'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextField(
              controller: dateInput,
              //editing controller of this TextField
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today,
                      color: _isTap ? Colors.grey : Colors.black),
                  prefixIconColor: Colors.grey,
                  filled: true,
                  fillColor: Color.fromARGB(246, 246, 246, 246),
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
                  hintText: '__/__/____',
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
                            onSurface: Color.fromARGB(
                                255, 20, 20, 20), // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Color.fromARGB(
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

                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  print(formattedDate);
                  setState(() {
                    dateInput.text = formattedDate;
                  });
                } else {}
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Text('Karar'),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            TextFormField(
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
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(150, 45),
                  backgroundColor: const Color.fromARGB(255, 1, 28, 63)),
              onPressed: () {
                pickFiles();
              },
              icon: Icon(Icons.file_copy),
              label: const Text(
                'Yeni Dosya Yükle',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(150, 45),
                  backgroundColor: HexColor('#5DB075')),
              onPressed: () {},
              icon: Icon(Icons.save),
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

  void _showToast() => Fluttertoast.showToast(
        msg: 'Button Tapped',
      );
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

  getCommissions() async {
    CommissionInformationResponse response =
        await commissionDropdownService.getCommissions();
    if (response.hasError == false) {
      commissionInformation.addAll(response.commissionInformation);

      print(response.commissionInformation.length);
      setState(() {});
    } else {
      print(response.errorMessage);
    }
  }

  getCourts() async {
    CourtInformationResponse response = await courtDropdownService.getCourts(2);
    if (response.hasError == false) {
      courtInformation.addAll(response.courtInformation);
      print(courtInformation[1].CourtName);

      setState(() {
        print(response.courtInformation.length);
      });
    } else {
      print(response.errorMessage);
    }
  }
}
