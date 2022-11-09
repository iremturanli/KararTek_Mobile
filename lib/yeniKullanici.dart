import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/widgets/comboBox.dart';
import 'package:flutter_application_1/sifremiUnuttum.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class yeniKullanici extends StatefulWidget {
  const yeniKullanici({Key? key}) : super(key: key);

  @override
  State<yeniKullanici> createState() => _yeniKullaniciState();
}

class _yeniKullaniciState extends State<yeniKullanici> {
  TextEditingController nameController = TextEditingController();
  TextEditingController tcController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController baroSicilController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 20),
                        // padding: const EdgeInsets.all(9),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 8.5,
                          child: TextField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            decoration: const InputDecoration(
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
                                labelText: 'Ad Soyad',
                                hintText: "Ad Soyad Giriniz",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 80),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.height / 3.5),
                        child: const Text('Kullanıcı Tipi'),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 90),
                      ComboBox(items: kullaniciTipi),
                      SizedBox(height: MediaQuery.of(context).size.height / 90),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.height / 3),
                        child: const Text('Şehir'),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 90),
                      ComboBox(items: sehir),
                      SizedBox(height: MediaQuery.of(context).size.height / 30),

                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 8.5,
                          child: TextFormField(
                            controller: tcController,
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
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                labelText: 'TC Kimlik No',
                                hintText: 'TC Kimlik No Giriniz',
                                // Here is key idea
                                labelStyle: TextStyle(color: Colors.black)),
                          )),
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 8.5,
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
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                labelText: 'Cep Telefonu',
                                hintText: '(5__) ___ __ __',
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30),
                        // padding: const EdgeInsets.all(9),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 8.5,
                          child: TextField(
                            controller: baroSicilController,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            decoration: const InputDecoration(
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
                                labelText: 'Baro Sicil No',
                                hintText: "Baro Sicil No Giriniz",
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30),
                        // padding: const EdgeInsets.all(9),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 8.5,
                          child: TextField(
                            controller: baroSicilController,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            decoration: const InputDecoration(
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
                                labelText: 'E-Posta',
                                hintText: "E-Posta Giriniz",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: EdgeInsets.only(top: 150),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.height / 20),
                            child: ElevatedButton(
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
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 25),
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: const Text(
                                'Kayıt Ol',
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ),
                    ]))));
  }
}
