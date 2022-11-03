import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/comboBox.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

enum GenderCharacter { erkek, kadin }

class Profilim extends StatefulWidget {
  const Profilim({Key? key}) : super(key: key);

  @override
  State<Profilim> createState() => _profilimState();
}

class _profilimState extends State<Profilim> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GenderCharacter? _character = GenderCharacter.erkek;
  final List<String> Il = [
    'Adana',
    '...',
    'Düzce',
  ];
  final List<String> Ilce = [
    '.',
    '..',
    '...',
    '....',
  ];

  var maskPhoneFormatter = new MaskTextInputFormatter(
      mask: '(###) ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Profilim',
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
              SizedBox(height: MediaQuery.of(context).size.height / 150),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png'),
                    radius: 50,
                  ),
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 10),
                      IconButton(
                          iconSize: 30,
                          onPressed: () {
                            pickFiles();
                          },
                          icon: Icon(Icons.add_photo_alternate))
                    ],
                  )
                ],
              ),
              Text('Ad'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                readOnly: true,
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
                    hintText: 'Ad',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Soyad'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                readOnly: true,
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
                    hintText: 'Soyad',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('TC Kimlik No'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                readOnly: true,
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
                    hintText: 'TC Kimlik No',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Kullanıcı Adı'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                readOnly: true,
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
                    hintText: 'Kullanıcı Adı',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Şifre'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                readOnly: true,
                obscureText: true,
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
                    hintText: 'Şifre',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 32),
              Text('Cep Telefonu'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
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
                    hintText: 'Cep Telefonu',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('E-Posta'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
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
                    hintText: 'E-Posta',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: const Text("Erkek"),
                      trailing: Radio<GenderCharacter>(
                        value: GenderCharacter.erkek,
                        groupValue: _character,
                        onChanged: (GenderCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Kadın"),
                      trailing: Radio<GenderCharacter>(
                        value: GenderCharacter.kadin,
                        groupValue: _character,
                        onChanged: (GenderCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Fax'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
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
                    hintText: 'Fax',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Telefon'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
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
                    hintText: 'Telefon',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Doğum Tarihi'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
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
                    hintText: '__/__/____',
                    hintStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('İl'),
              ComboBox(items: Il),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('İlçe'),
              ComboBox(items: Ilce),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Adres'),
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
                    hintText: 'Adres',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(
                            MediaQuery.of(context).size.height / 5,
                            MediaQuery.of(context).size.width / 9),
                        backgroundColor: Color.fromARGB(255, 175, 0, 0)),
                    onPressed: _showToast,
                    child: const Text(
                      'Çıkış Yap',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(
                            MediaQuery.of(context).size.height / 5,
                            MediaQuery.of(context).size.width / 9),
                        backgroundColor: HexColor('#5DB075')),
                    onPressed: _showToast,
                    child: const Text(
                      'Kaydet',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
            ],
          ),
        ));
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
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final filePath = FlutterFileDialog.saveFile(params: params);
  }
}
