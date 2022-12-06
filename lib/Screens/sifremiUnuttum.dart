// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/homePage.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../ApiResponse/forgotMyPasswordResponse.dart';
import '../AppConfigurations/appConfigurations.dart';
import '../models/ForgotMyPasswordInformation.dart/forgotMyPasswordInformation.dart';
import '../services/Registration/RegistrationService.dart';

class sifremiUnuttum extends StatefulWidget {
  const sifremiUnuttum({Key? key}) : super(key: key);

  @override
  State<sifremiUnuttum> createState() => _sifremiUnuttumState();
}

class _sifremiUnuttumState extends State<sifremiUnuttum> {
  TextEditingController identityController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  final RegistrationService registrationService =
      getIt.get<RegistrationService>();
  final _formKey = GlobalKey<FormState>();
  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/karar5.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 10),
                    child: const Image(
                      image: AssetImage("assets/images/login-logo.png"),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TC Kimlik No',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 80,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextField(
                          controller: identityController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              // ignore: prefer_const_constructors
                              borderSide: BorderSide(
                                width: 1,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255))),
                            hintText: "Kimlik Numaranızı Giriniz.",
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 80),
                      const Text('Email',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      SizedBox(height: MediaQuery.of(context).size.height / 80),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          controller: mailController,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              hintText: 'Email adresinizi giriniz',
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(350, 50),
                      backgroundColor: const Color.fromARGB(255, 1, 28, 63),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        forgotMyPassword(
                            identityController.text, mailController.text);
                      }
                    },
                    child: const Text(
                      'Şifre Gönder',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(350, 50),
                      backgroundColor: const Color.fromARGB(255, 194, 27, 5),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text(
                      'Geri',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ))),
    ));
  }

  forgotMyPassword(String IdentityNo, String email) async {
    try {
      ForgotMyPasswordInformationResponse response = await registrationService
          .forgotMyPassword(ForgotMyPasswordInformation(
              identityNumber: IdentityNo, email: email));
      if (response.hasError == false) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
        // Get result from server
      } else {
        print(response.errorMessage);
      }
    } catch (e) {
      print(e);
    }
  }
}
