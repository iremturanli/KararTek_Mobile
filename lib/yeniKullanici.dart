import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/comboBox.dart';
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
                child: Column(children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70.0, bottom: 20),
                      child: Text(
                        'Yeni Kullanıcı',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    // padding: const EdgeInsets.all(9),
                    child: SizedBox(
                      width: 350,
                      height: 52,
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Ad Soyad',
                            hintText: "Ad Soyad Giriniz",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 260.0),
                    child: Text('Kullanıcı Tipi'),
                  )),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: ComboBox(items: kullaniciTipi),
                  )),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 304.0),
                    child: Text('Şehir'),
                  )),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: ComboBox(items: sehir),
                  )),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    // padding: const EdgeInsets.all(9),
                    child: SizedBox(
                        width: 350,
                        height: 52,
                        child: TextFormField(
                          controller: tcController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 99, 99, 99))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 124, 124, 124))),
                              labelText: 'TC Kimlik No',
                              hintText: 'TC Kimlik No Giriniz',
                              // Here is key idea
                              labelStyle: TextStyle(color: Colors.black)),
                        )),
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
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Cep Telefonu',
                            hintText: '(5__) ___ __ __',
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 35),
                    // padding: const EdgeInsets.all(9),
                    child: SizedBox(
                      width: 350,
                      height: 52,
                      child: TextField(
                        controller: baroSicilController,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Baro Sicil No',
                            hintText: "Baro Sicil No Giriniz",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 35),
                    // padding: const EdgeInsets.all(9),
                    child: SizedBox(
                      width: 350,
                      height: 52,
                      child: TextField(
                        controller: baroSicilController,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
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
                        padding: const EdgeInsets.only(left: 45.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: Size(150, 50),
                            backgroundColor: Color.fromARGB(255, 1, 28, 63),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          },
                          child: const Text(
                            'Kaydol',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: Size(150, 50),
                            backgroundColor: Color.fromARGB(255, 194, 27, 5),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: const Text(
                            'Vazgeç',
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
