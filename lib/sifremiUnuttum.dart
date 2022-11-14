import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class sifremiUnuttum extends StatefulWidget {
  const sifremiUnuttum({Key? key}) : super(key: key);

  @override
  State<sifremiUnuttum> createState() => _sifremiUnuttumState();
}

class _sifremiUnuttumState extends State<sifremiUnuttum> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(###) ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/karar5.png"), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 10),
                    child: Image(
                      image: AssetImage("assets/login-logo.png"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        controller: nameController,
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
                          labelText: 'TC Kimlik No',
                          hintText: "Kimlik Numaranızı Giriniz.",
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 30),
                    // padding: const EdgeInsets.all(9),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        autocorrect: false,
                        inputFormatters: [maskFormatter],
                        controller: phoneController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255))),
                            labelText: 'Cep Telefonu',
                            hintText: '(5__) ___ __ __',
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 150),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
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
                          minimumSize: const Size(350, 50),
                          backgroundColor: const Color.fromARGB(255, 1, 28, 63),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
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
                          backgroundColor:
                              const Color.fromARGB(255, 194, 27, 5),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          'Geri',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                  // ),
                ],
              ))),
    ));
  }
}
