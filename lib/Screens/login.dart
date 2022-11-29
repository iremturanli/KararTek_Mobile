import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/sifremiUnuttum.dart';
import 'package:flutter_application_1/Screens/homePage.dart';

import '../AppConfigurations/appConfigurations.dart';
import '../main.dart';
import '../models/UserInformation/userInformation.dart';
import '../models/UserLoginInformation/userLoginInformation.dart';
import '../services/Registration/RegistrationService.dart';
import '../../apiResponse/userLoginInformationResponse.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final RegistrationService registrationService =
      getIt.get<RegistrationService>();
  UserInformation userInformation = UserInformation();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
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
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: const Image(
                        image: AssetImage("assets/images/login-logo.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TC Kimlik No',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 80),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.length < 11) {
                              return 'TC Kimlik No Giriniz';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                // ignore: prefer_const_constructors
                                borderSide: BorderSide(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              hintText: "Kimlik Numaranızı Giriniz.",
                              labelStyle: const TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 80),
                      const Text(
                        'Şifre',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 80),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 8) {
                                return 'Şifre Giriniz';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText:
                                !_passwordVisible, //Dinamik olarak gizlemeyi değiştirir
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,

                              hintText: 'Şifrenizi giriniz.',
                              labelStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                // ignore: prefer_const_constructors
                                borderSide: BorderSide(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              // Here is key idea
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // seçilen Icon'a göre değişir
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Icon'a tıklandığında değişir
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 45),
                  TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const sifremiUnuttum()));
                      },
                      child: const Text('Şifremi Unuttum')),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 150),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          minimumSize: Size(350, 50),
                          backgroundColor: Color.fromARGB(255, 1, 28, 63),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginUser(
                                nameController.text, passwordController.text);
                          }
                        },
                        child: const Text(
                          'Giriş',
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
                          backgroundColor: Color.fromARGB(255, 194, 27, 5),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard())); //düzelt
                        },
                        child: const Text(
                          'Geri',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    ));
  }

  /* Methods */ //h

  loginUser(String IdentityNo, String Password) async {
    try {
      UserLoginInformationResponse response =
          await registrationService.userLogin(UserLoginInformation(
              identityNumber: IdentityNo, password: Password));
      if (response.hasError == false) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        // Get result from server
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (ctx) => AlertDialog(
                  backgroundColor: Color.fromARGB(255, 221, 226, 241),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  title: const Text(
                      "Bilgiler hatalıdır kontrol ederek tekrar deneyiniz!"),
                  actions: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(120, 50),
                                backgroundColor:
                                    Color.fromARGB(255, 175, 172, 172),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text(
                              "TAMAM",
                            ),
                          ),
                        ]),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                  ],
                ));
        print(response.errorMessage);
      }
    } catch (e) {
      print(e);
    }
  }
}
