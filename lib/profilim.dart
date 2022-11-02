import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/comboBox.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

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

  var maskFormatter = new MaskTextInputFormatter(
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
          actions: <Widget>[
            ElevatedButton.icon(
              icon: Icon(Icons.add_a_photo_outlined),
              label: CircleAvatar(),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Ad'),
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
                    labelText: 'Ad',
                    labelStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Soyad'),
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
                    labelText: 'Soyad',
                    labelStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('TC Kimlik No'),
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
                    labelText: 'TC Kimlik No',
                    labelStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Kullanıcı Adı'),
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
                    labelText: 'Kullanıcı Adı',
                    labelStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Şifre'),
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
                    labelText: 'Şifre',
                    labelStyle: const TextStyle(color: Colors.black)),
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
                    labelText: 'Cep Telefonu',
                    labelStyle: const TextStyle(color: Colors.black)),
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
                    labelText: 'E-Posta',
                    labelStyle: const TextStyle(color: Colors.black)),
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
                    labelText: 'Fax',
                    labelStyle: const TextStyle(color: Colors.black)),
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
                    labelText: 'Telefon',
                    labelStyle: const TextStyle(color: Colors.black)),
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
                    labelText: 'Doğum Tarihi',
                    labelStyle: const TextStyle(color: Colors.black)),
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
                    labelText: 'Adres',
                    alignLabelWithHint: true,
                    labelStyle: const TextStyle(color: Colors.black)),
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
}
