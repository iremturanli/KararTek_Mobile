import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ApiResponse/UserInformationResponse.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
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

class Profilim2 extends StatefulWidget {
  const Profilim2({Key? key}) : super(key: key);

  @override
  State<Profilim2> createState() => _Profilim2State();
}

class _Profilim2State extends State<Profilim2> {
  XFile? _imageFileSelected;
  void _setImageFileListFromFile(XFile? value) {
    //_imageFileSelected = value == null ? null : value;
  }

  final UserService userService = getIt.get<UserService>();

  List<UserListInformation> usersInformations = [];
  final ImagePicker _picker = ImagePicker();

  // getImageFromGallery() async {
  //   _imageFileSelected = await _picker.pickImage(source: ImageSource.gallery);
  // }

  TextEditingController dateInput = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    getUserById();
    super.initState();
    dateInput.text = "";
  }

  bool _isTap = false;
// TextEditingController nameController =
//         TextEditingController.fromValue(TextEditingValue(text:userInformations[0].firstName!.toString()));

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
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Kullanıcı Adı:'),
                  usersInformations.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 35)
                      : Text(usersInformations[0].firstName!),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              CustomDivider(),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Kullanıcı Soyadı: '),
                  SizedBox(height: MediaQuery.of(context).size.height / 120),
                  usersInformations.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 35)
                      : Text(usersInformations[0].lastName!),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              CustomDivider(),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Kullanıcı TC Kimlik No: '),
                  SizedBox(height: MediaQuery.of(context).size.height / 120),
                  usersInformations.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 35)
                      : Text(usersInformations[0].identityNumber!),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              CustomDivider(),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Kullanıcı Cep Telefonu: '),
                  SizedBox(height: MediaQuery.of(context).size.height / 120),
                  usersInformations.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 35)
                      : Text(usersInformations[0].phoneNumber!),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              CustomDivider(),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Kullanıcı E-Posta: '),
                  SizedBox(height: MediaQuery.of(context).size.height / 120),
                  usersInformations.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 35)
                      : Text(usersInformations[0].email!),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              CustomDivider(),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('İl: '),
                  SizedBox(height: MediaQuery.of(context).size.height / 120),
                  usersInformations.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 35)
                      : Text(usersInformations[0].cityName!),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              CustomDivider(),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('İlçe: '),
                  SizedBox(height: MediaQuery.of(context).size.height / 120),
                  usersInformations.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 35)
                      : Text(usersInformations[0].districtName!),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              CustomDivider(),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Şifre Değiştir: '),
                  SizedBox(height: MediaQuery.of(context).size.height / 120),
                  usersInformations.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 35)
                      : IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ],
              ),
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

  getUserById() async {
    UserInformationResponse response = await userService.getUserById();
    if (response.success == true) {
      usersInformations.addAll(response.data!);

      print(response.success);
      setState(() {});

      print(response);
    } else {
      print(response.message);
    }
  }
}
