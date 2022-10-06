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
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/karar5.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Image(
                        image: AssetImage("assets/login-logo.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 200),
                      // padding: const EdgeInsets.all(9),
                      child: SizedBox(
                        width: 350,
                        child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              labelText: 'TC Kimlik No',
                              hintText: "Kimlik Numaranızı Giriniz.",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      // padding: const EdgeInsets.all(9),
                      child: SizedBox(
                        width: 350,
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
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              labelText: 'Cep Telefonu',
                              hintText: '(5__) ___ __ __',
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 150),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
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
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: Size(350, 50),
                            backgroundColor: Color.fromARGB(255, 194, 27, 5),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
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
                ))));
  }
}
