// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/UserChangePasswordInformationResponse.dart';
import 'package:flutter_application_1/services/UserService/UserService.dart';
import 'package:hexcolor/hexcolor.dart';
import '../AppConfigurations/appConfigurations.dart';
import 'comboBox.dart';

class ModalBottomChangePassword extends StatefulWidget {
  ModalBottomChangePassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalBottomChangePassword> createState() =>
      _ModalBottomChangePassword();
}

class _ModalBottomChangePassword extends State<ModalBottomChangePassword> {
  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _againPasswordVisible = false;
  final UserService userService = getIt.get<UserService>();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController againPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 40,
              right: MediaQuery.of(context).size.width / 25,
              left: MediaQuery.of(context).size.width / 25,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Şifre Değiştir',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "Önceki Şifreniz",
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return 'Şifre Giriniz';
                      }
                      return null;
                    },
                    // keyboardType: TextInputType.text,
                    controller: currentPasswordController,
                    obscureText: !_currentPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          // seçilen Icon'a göre değişir
                          _currentPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Icon'a tıklandığında değişir
                          setState(() {
                            _currentPasswordVisible = !_currentPasswordVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Şifrenizi Giriniz',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  Text(
                    "Yeni Şifreniz",
                  ),
                  TextFormField(
                      controller: newPasswordController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'Şifre Giriniz';
                        }
                        return null;
                      },
                      obscureText: !_newPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // seçilen Icon'a göre değişir
                            _newPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Icon'a tıklandığında değişir
                            setState(() {
                              _newPasswordVisible = !_newPasswordVisible;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Yeni Şifrenizi Giriniz',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: const Color.fromARGB(255, 189, 189, 189),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      )),
                  // child: TextFormField(
                  //         decoration: const InputDecoration(
                  //       hintText: 'İlk Sıra No',
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(8))),
                  //       enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //             width: 1,
                  //             color: Color.fromARGB(255, 189, 189, 189),
                  //           ),
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(8))),
                  //     )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  Text(
                    "Yeni Şifreniz(Tekrar)",
                  ),
                  TextFormField(
                      controller: againPasswordController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'Şifre Giriniz';
                        }
                        return null;
                      },
                      obscureText: !_againPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // seçilen Icon'a göre değişir
                            _againPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Icon'a tıklandığında değişir
                            setState(() {
                              _againPasswordVisible = !_againPasswordVisible;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Yeni Şifrenizi Giriniz',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: const Color.fromARGB(255, 189, 189, 189),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 35),
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
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "İPTAL",
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(120, 50),
                              backgroundColor: HexColor('#5DB075'),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if ((currentPasswordController.text ==
                                      newPasswordController.text) ||
                                  (currentPasswordController.text ==
                                      againPasswordController.text)) {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          backgroundColor: const Color.fromARGB(
                                              255, 221, 226, 241),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          title: const Text(
                                              "Girilen yeni şifre, eski şifrenizle aynı olamaz!"),
                                          actions: <Widget>[
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        minimumSize:
                                                            const Size(120, 50),
                                                        backgroundColor:
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                175,
                                                                172,
                                                                172),
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10)))),
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: const Text(
                                                      "TAMAM",
                                                    ),
                                                  ),
                                                ]),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40),
                                          ],
                                        ));
                              } else if (newPasswordController.text ==
                                  againPasswordController.text) {
                                changePassword(currentPasswordController.text,
                                    newPasswordController.text);
                              } else {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          backgroundColor: const Color.fromARGB(
                                              255, 221, 226, 241),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          title: const Text(
                                              "Girilen şifreler birbiriyle eşleşmemektedir!"),
                                          actions: <Widget>[
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        minimumSize:
                                                            const Size(120, 50),
                                                        backgroundColor:
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                175,
                                                                172,
                                                                172),
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10)))),
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: const Text(
                                                      "TAMAM",
                                                    ),
                                                  ),
                                                ]),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40),
                                          ],
                                        ));
                              }
                            }
                          },
                          child: const Text(
                            "DEĞİŞTİR",
                          ),
                        ),
                      ]),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                ],
              ),
            )),
      ],
    );
  }

  changePassword(String? currentPassword, String? newPassword) async {
    UserChangePasswordInformationResponse response =
        await userService.changePassword(currentPassword, newPassword);
    if (response.hasError == false) {
      Navigator.pop(context);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 221, 226, 241),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                title: const Text(
                    "Şifreniz başarıyla değiştirilmiştir. Yeni şifreniz email adresinize de gönderilecektir!"),
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
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 221, 226, 241),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                title: const Text(
                    "Girdiğiniz bilgileri kontrol ederek tekrar giriniz!"),
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
      print(response.message);
    }
  }
}
