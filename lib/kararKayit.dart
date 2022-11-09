import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:hexcolor/hexcolor.dart';

class kararKayit extends StatefulWidget {
  kararKayit({
    Key? key,
  }) : super(key: key);

  @override
  State<kararKayit> createState() => _kararKayitState();
}

class _kararKayitState extends State<kararKayit> {
  late List<String> docPaths;
  final textEditingController = TextEditingController();
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
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
                  labelText: 'Daire / Kurul Adı',
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
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
                  labelText: 'Mahkeme*',
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
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
                  labelText: 'Avukat Değerlendirmesi',
                  alignLabelWithHint: true,
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
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
                  labelText: 'Dava Türü',
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Text('Esas No*'),
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
                        hintText: 'Esas No',
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
                  labelText: 'Karar Tarihi',
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
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
                  labelText: 'Karar',
                  alignLabelWithHint: true,
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(150, 45),
                  backgroundColor: const Color.fromARGB(255, 1, 28, 63)),
              onPressed: () {
                pickFiles();
              },
              child: const Text(
                'Yeni Dosya Yükle',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(150, 45),
                  backgroundColor: HexColor('#5DB075')),
              onPressed: () {},
              child: const Text(
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
}
