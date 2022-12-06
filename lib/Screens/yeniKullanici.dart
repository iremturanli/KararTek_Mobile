import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/userTypeDropdownResponse.dart';
import 'package:flutter_application_1/AppConfigurations/appConfigurations.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:flutter_application_1/models/CityInformation/cityInformation.dart';
import 'package:flutter_application_1/models/UserRegisterInformation/userRegisterInformation.dart';
import 'package:flutter_application_1/models/UserTypeInformation/userTypeInformation.dart';
import 'package:flutter_application_1/services/DropDownServices/UserTypeDropdownServices.dart';
import 'package:flutter_application_1/services/Registration/RegistrationService.dart';
import 'package:flutter_application_1/main.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../ApiResponse/CityDropdownResponse.dart';
import '../services/DropDownServices/CityDropdownService.dart';

class yeniKullanici extends StatefulWidget {
  const yeniKullanici({Key? key}) : super(key: key);

  @override
  State<yeniKullanici> createState() => _yeniKullaniciState();
}

// ignore: camel_case_types
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

  final RegistrationService registrationService =
      getIt.get<RegistrationService>();

  final UserTypeDropDownService userTypeDropDownService =
      getIt.get<UserTypeDropDownService>();
  final CityDropdownService cityDropdownService =
      getIt.get<CityDropdownService>();

  UserRegisterInformation userRegisterInformation = UserRegisterInformation();
  List<UserTypeInformation> userTypeInformation = [];
  List<CityInformation> cityInformation = [];
  UserTypeInformation? selectedOption;
  CityInformation? selectedCity;

  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    super.initState();
    getUserTypes();
    getCities();
  }

  @override
  Widget build(BuildContext context) {
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
                              // ignore: unnecessary_new
                              new DropdownButtonFormField<UserTypeInformation>(
                            isExpanded: true,
                            //underline: SizedBox.shrink(),
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
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
                              return DropdownMenuItem<UserTypeInformation>(
                                value: userTypeInformation,
                                child: Text(
                                  userTypeInformation.TypeName!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const Text('Şehir'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),

                        Container(
                          height: 45,
                          width: 330,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: DropdownButtonFormField<CityInformation>(
                            isExpanded: true,
                            //underline: SizedBox.shrink(),
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            dropdownColor: Colors.white,
                            value: selectedCity,
                            onChanged: (CityInformation? newValue) {
                              setState(() {
                                selectedCity = newValue;
                                print(selectedCity!.CityID.toString());
                              });
                            },

                            validator: (value) => value == null
                                ? "Bu alan boş bırakılamaz"
                                : null,
                            items: cityInformation
                                .map((CityInformation cityInformation) {
                              return DropdownMenuItem<CityInformation>(
                                value: cityInformation,
                                child: Text(
                                  cityInformation.CityName!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

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
                                const Text('Baro Sicil No'),
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
                                const Text('Üniversite'),
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
                                        hintText: "Üniversite Giriniz",
                                        labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                ),
                                const Text('Fakülte'),
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
                                        hintText: "Fakülte Giriniz",
                                        labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                ),
                                const Text('Sınıf'),
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
                                        hintText: "Sınıf Giriniz",
                                        labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ),
                                ),
                                const Text('Okul Numarası'),
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
                            keyboardType: TextInputType.emailAddress,
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
                                    builder: (context) => const Home()));
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
                                userRegisterInformation.firstName =
                                    nameController.text;
                                userRegisterInformation.lastName =
                                    lastnameController.text;
                                userRegisterInformation.userTypeId =
                                    selectedOption!.TypeID;
                                userRegisterInformation.cityId =
                                    selectedCity!.CityID;
                                userRegisterInformation.identityNumber =
                                    tcController.text;
                                userRegisterInformation.phoneNumber =
                                    phoneController.text;
                                userRegisterInformation.barRegisterNo =
                                    baroSicilController.text;
                                userRegisterInformation.email =
                                    emailController.text;

                                registerUser(userRegisterInformation);
                              }
                              //UserRegisterInformation userRegisterInformation = UserRegisterInformation(City: ,);
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

  registerUser(UserRegisterInformation userRegisterInformation) async {
    MobileApiResponse response =
        await registrationService.userRegistration(userRegisterInformation);
    if (response.hasError == false) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 221, 226, 241),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                title: const Text(
                    "Kayıt işlemi tamamlandı. Şifreniz e-mail adresinize iletilecektir."),
                actions: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(120, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 175, 172, 172),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: const Text(
                            "TAMAM",
                          ),
                        ),
                      ]),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                ],
              ));
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 221, 226, 241),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                title: const Text(
                    "Girdiğiniz bilgiler kayıtlı bir kullanıcının bilgileri ile eşleşmektedir!"),
                actions: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(120, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 175, 172, 172),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text(
                            "TAMAM",
                          ),
                        ),
                      ]),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                ],
              ));
      print(response.errorMessage);
    }
  }

  getUserTypes() async {
    UserTypeInformationResponse response =
        await userTypeDropDownService.getUserTypes();
    if (response.hasError == false) {
      userTypeInformation.add(response.userTypeInformation[0]);
      userTypeInformation.add(response.userTypeInformation[1]);
      print(response.userTypeInformation.length);
      setState(() {
        print("success");
      });
    } else {
      print(response.errorMessage);
    }
  }

  getCities() async {
    CityInformationResponse response = await cityDropdownService.getCities();
    if (response.hasError == false) {
      cityInformation.addAll(response.cityInformation);

      print(response.cityInformation.length);
      setState(() {
        print("success");
      });
    } else {
      print(response.errorMessage);
    }
  }
}
