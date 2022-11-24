import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/userTypeDropdownResponse.dart';
import 'package:flutter_application_1/AppConfigurations/appConfigurations.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:flutter_application_1/models/UserRegisterInformation/userRegisterInformation.dart';
import 'package:flutter_application_1/models/UserTypeInformation/userTypeInformation.dart';
import 'package:flutter_application_1/services/DropDownServices/UserTypeDropdownServices.dart';
import 'package:flutter_application_1/services/Registration/RegistrationService.dart';
import 'package:flutter_application_1/widgets/comboBox.dart';
import 'package:flutter_application_1/Screens/sifremiUnuttum.dart';
import 'package:flutter_application_1/Screens/homePage.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widgets/comboboxTest.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class yeniKullanici extends StatefulWidget {
  yeniKullanici({Key? key}) : super(key: key);

  @override
  State<yeniKullanici> createState() => _yeniKullaniciState();
}

class _yeniKullaniciState extends State<yeniKullanici> {
  bool isStudentVisible = false;
  bool isLawyerVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController tcController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController baroSicilController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController studentNoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? value1;

  final RegistrationService registrationService =
      getIt.get<RegistrationService>();

  final UserTypeDropDownService userTypeDropDownService =
      getIt.get<UserTypeDropDownService>();

  UserRegisterInformation userRegisterInformation = UserRegisterInformation();
  List<UserTypeInformation> userTypeInformation = [];
  UserTypeInformation? selectedOption;

  final List<String> kullaniciTipi = [
    'Avukat - Avukat Stajyeri',
    'Öğrenci',
  ];
  final List<String> sehir = [
    'Adana',
    '...',
    'Düzce',
  ];
  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getUserTypes();
    print("sdfadfadf");
  }

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/karar5.png"),
                fit: BoxFit.cover)),
      ),
      SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 10),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: const Text(
                          'Kayıt Ol',
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ad'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 11.5,
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bu Alan Boş Bırakılamaz';
                              }
                              return null;
                            },
                            autocorrect: false,
                            decoration: const InputDecoration(
                                helperText: ' ',
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                hintText: "Ad Giriniz",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        //SizedBox(
                        //  height: MediaQuery.of(context).size.height / 80),
                        const Text('Soyad'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 11.5,
                          child: TextFormField(
                            controller: lastnameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bu Alan Boş Bırakılamaz';
                              }
                              return null;
                            },
                            autocorrect: false,
                            decoration: const InputDecoration(
                                helperText: ' ',
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                hintText: "Soyad Giriniz",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 80),
                        const Text('Kullanıcı Tipi'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),

                        Container(
                          height: 45,
                          width: 330,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child:
                              new DropdownButtonFormField<UserTypeInformation>(
                            isExpanded: true,
                            //underline: SizedBox.shrink(),
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                            dropdownColor: Colors.white,
                            value: selectedOption,
                            onChanged: (UserTypeInformation? newValue) {
                              setState(() {
                                //selectedOption = newValue;

                                if (newValue!.TypeID == 2) {
                                  isStudentVisible = true;
                                  isLawyerVisible = false;
                                  selectedOption = newValue;
                                } else {
                                  isStudentVisible = false;
                                  isLawyerVisible = true;
                                  selectedOption = newValue;
                                }
                                print(selectedOption!.TypeID.toString());
                              });
                            },

                            validator: (value) => value == null
                                ? "Bu alan boş bırakılamaz"
                                : null,
                            items: userTypeInformation
                                .map((UserTypeInformation userTypeInformation) {
                              return new DropdownMenuItem<UserTypeInformation>(
                                value: userTypeInformation,
                                child: Text(
                                  userTypeInformation.TypeName!,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        // ComboBox(
                        //   items: kullaniciTipi,
                        //   color_of_box: Color.fromARGB(255, 255, 255, 255),
                        //   color_of_text: Colors.black,
                        //   height_of_box: MediaQuery.of(context).size.width / 8.5,
                        //   width_of_box: MediaQuery.of(context).size.width / 1.2,
                        //   size_of_font: 12,
                        //   onChanged: (value){

                        //   },
                        // ),
                        // Combobox1(
                        //     items: kullaniciTipi,
                        //     value: selectedValue,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         //print(value);
                        //         if (value == "Avukat - Avukat Stajyeri") {
                        //           selectedValue = value;
                        //           status = 0;
                        //         } else {
                        //           selectedValue = value;
                        //           status = 1;
                        //         }
                        //       });
                        //     }),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        const Text('Şehir'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        ComboBox(
                            value: selectedValue,
                            items: sehir,
                            onChanged: (value) {
                              setState(() {
                                if (value == "Adana") {
                                  selectedValue = value;
                                } else {
                                  selectedValue = value;
                                }
                              });
                            },
                            color_of_box: Color.fromARGB(255, 255, 255, 255),
                            color_of_text: Colors.black,
                            height_of_box:
                                MediaQuery.of(context).size.width / 8.5,
                            size_of_font: 12,
                            width_of_box:
                                MediaQuery.of(context).size.width / 1.2),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        const Text('TC Kimlik No'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 11.5,
                            child: TextFormField(
                              controller: tcController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Bu Alan Boş Bırakılamaz';
                                }
                                return null;
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11)
                              ],
                              decoration: const InputDecoration(
                                  helperText: ' ',
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                  hintText: 'TC Kimlik No Giriniz',
                                  // Here is key idea
                                  labelStyle: TextStyle(color: Colors.black)),
                            )),

                        const Text('Cep Telefonu'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 11.5,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            autocorrect: false,
                            inputFormatters: [maskFormatter],
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bu Alan Boş Bırakılamaz';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                helperText: ' ',
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                hintText: '(5__) ___ __ __',
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Visibility(
                            visible: isLawyerVisible,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Baro Sicil No'),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        80),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 11.5,
                                  child: TextFormField(
                                    controller: baroSicilController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Bu Alan Boş Bırakılamaz';
                                      }
                                      return null;
                                    },
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        helperText: ' ',
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        hintText: "Baro Sicil No Giriniz",
                                        labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                ),
                              ],
                            )),
                        Visibility(
                            visible: isStudentVisible,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Üniversite'),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        80),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 11.5,
                                  child: TextFormField(
                                    controller: universityController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Bu Alan Boş Bırakılamaz';
                                      }
                                      return null;
                                    },
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        helperText: ' ',
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        hintText: "Üniversite Giriniz",
                                        labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                ),
                                Text('Fakülte'),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        80),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 11.5,
                                  child: TextFormField(
                                    controller: facultyController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Bu Alan Boş Bırakılamaz';
                                      }
                                      return null;
                                    },
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        helperText: ' ',
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        hintText: "Fakülte Giriniz",
                                        labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                ),
                                Text('Sınıf'),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 11.5,
                                  child: TextFormField(
                                    controller: gradeController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Bu Alan Boş Bırakılamaz';
                                      }
                                      return null;
                                    },
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        helperText: ' ',
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        hintText: "Sınıf Giriniz",
                                        labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                ),
                                Text('Okul Numarası'),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        80),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 11.5,
                                  child: TextFormField(
                                    controller: studentNoController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Bu Alan Boş Bırakılamaz';
                                      }
                                      return null;
                                    },
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        helperText: ' ',
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        hintText: "Öğrenci No Giriniz",
                                        labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                ),
                              ],
                            )),

                        const Text('E-Posta'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 11.5,
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bu Alan Boş Bırakılamaz';
                              }
                              return null;
                            },
                            autocorrect: false,
                            decoration: const InputDecoration(
                                helperText: ' ',
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                hintText: "E-Posta Giriniz",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: const Size(150, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 194, 27, 5),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context, //Color.fromARGB(255, 1, 28, 63),
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: const Text(
                            'Vazgeç',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              minimumSize: const Size(150, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 28, 63),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              }
                               //UserRegisterInformation userRegisterInformation = UserRegisterInformation(City: ,);
                              registerUser(userRegisterInformation);
                            },
                            child: const Text(
                              'Kayıt Ol',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    // ),
                  ]),
            )),
      )
    ]));
  }

  //Methods

  registerUser(UserRegisterInformation userRegisterInformation
   ) async {
    MobileApiResponse response =
        await registrationService.userRegistration(UserRegisterInformation());
    if (response.hasError == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      print(response.errorMessage);
    }
  }

  getUserTypes() async {
    UserTypeInformationResponse response =
        await userTypeDropDownService.getUserTypes();
    if (response.hasError == false) {
      userTypeInformation.addAll(response.userTypeInformation);
      print(response.userTypeInformation.length);
      setState(() {
        print("hello");
      });
    } else {
      print(response.errorMessage);
    }
  }
}
