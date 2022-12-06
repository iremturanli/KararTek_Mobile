import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ApiResponse/UserInformationResponse.dart';
import 'package:flutter_application_1/widgets/comboBox.dart';
import 'package:flutter_application_1/Screens/homePage.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:flutter_application_1/main.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../AppConfigurations/appConfigurations.dart';
import '../models/UserInformation/UserListInformation.dart';
import '../services/UserService/UserService.dart';

enum GenderCharacter { erkek, kadin }

class Profilim extends StatefulWidget {
  const Profilim({Key? key}) : super(key: key);

  @override
  State<Profilim> createState() => _ProfilimState();
}

class _ProfilimState extends State<Profilim> {
  XFile? _imageFileSelected;
  void _setImageFileListFromFile(XFile? value) {
    //_imageFileSelected = value == null ? null : value;
  }

  final UserService userService = getIt.get<UserService>();

  List<UserListInformation> userInformations = [];
  final ImagePicker _picker = ImagePicker();

  // getImageFromGallery() async {
  //   _imageFileSelected = await _picker.pickImage(source: ImageSource.gallery);
  // }

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    GetUserById();
    super.initState();
    String? name = userInformations[0].firstName;
  }

  bool _isTap = false;

  TextEditingController phoneController = TextEditingController();

  GenderCharacter? _character = GenderCharacter.erkek;
  final List<String> il = [
    'Adana',
    '...',
    'Düzce',
  ];
  final List<String> ilce = [
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
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 30),
          child: ListView(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 150),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: _imageFileSelected == null
                        ? null
                        : FileImage(File(_imageFileSelected!.path)),
                    radius: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            iconSize: 30,
                            onPressed: () {
                              _imgFromGallery();
                            },
                            icon: Icon(Icons.image)),
                        IconButton(
                            iconSize: 30,
                            onPressed: () {
                              _imgFromCamera();
                            },
                            icon: Icon(Icons.camera_alt_outlined))
                      ],
                    ),
                  )
                ],
              ),
              Text('Ad'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              Text(userInformations[0].firstName!),
              TextFormField(
                //controller: nameController,

                enabled: false,
                readOnly: true,
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(
                        width: 1,
                        color: const Color.fromARGB(255, 189, 189, 189),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(246, 246, 246, 246),
                    hintText: 'Ad',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('Soyad'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(
                        width: 1,
                        color: const Color.fromARGB(255, 189, 189, 189),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(246, 246, 246, 246),

                    // ignore: prefer_const_constructors

                    hintText: 'Soyad',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('TC Kimlik No'),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(246, 246, 246, 246),
                    disabledBorder: OutlineInputBorder(
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
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(246, 246, 246, 246),
                    disabledBorder: OutlineInputBorder(
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
              Stack(alignment: Alignment.centerRight, children: <Widget>[
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(246, 246, 246, 246),
                      disabledBorder: OutlineInputBorder(
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
                IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {},
                  icon: Icon(Icons.refresh),
                ),
              ]),
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
                      leading: Radio<GenderCharacter>(
                        activeColor: const Color.fromARGB(255, 1, 28, 63),
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
                      leading: Radio<GenderCharacter>(
                        activeColor: const Color.fromARGB(255, 1, 28, 63),
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
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      locale: const Locale("tr", "TR"),
                      builder: (BuildContext context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Color.fromARGB(
                                  255, 47, 47, 46), // header background color
                              onPrimary: Color.fromARGB(
                                  255, 195, 194, 194), // header text color
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
              Text('İl'),
              ComboBox(
                  items: il,
                  color_of_box: Color.fromARGB(246, 246, 246, 246),
                  color_of_text: Colors.black,
                  height_of_box: 55,
                  size_of_font: 12,
                  width_of_box: 360),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Text('İlçe'),
              ComboBox(
                  items: ilce,
                  color_of_box: Color.fromARGB(246, 246, 246, 246),
                  color_of_text: Colors.black,
                  height_of_box: 55,
                  size_of_font: 12,
                  width_of_box: 360),
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
                    onPressed: () {
                      Navigator.of(context);
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (ctx) => AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 221, 226, 241),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                title: const Text(
                                    "Çıkış Yapmak İstediğinize Emin Misiniz?"),
                                actions: <Widget>[
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: Size(120, 50),
                                              backgroundColor: Color.fromARGB(
                                                  255, 175, 172, 172),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Text(
                                            "İPTAL",
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: Size(120, 50),
                                              backgroundColor: Color.fromARGB(
                                                  255, 194, 27, 5),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Login()));
                                          },
                                          child: Text(
                                            "ÇIKIŞ",
                                          ),
                                        ),
                                      ]),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              40),
                                ],
                              ));
                    },
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
  _imgFromCamera() async {
    _imageFileSelected = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _setImageFileListFromFile(_imageFileSelected);
    });
  }

  _imgFromGallery() async {
    _imageFileSelected = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _setImageFileListFromFile(_imageFileSelected);
    });
  }

  GetUserById() async {
    try {
      UserInformationResponse response = await userService.getUserById();
      if (response.success == true) {
        userInformations.addAll(response.data!);

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
