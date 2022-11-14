import 'package:flutter/material.dart';

import 'comboBox.dart';

class ModalBottomOnay extends StatefulWidget {
  //final VoidCallback press;
  //final TextEditingController searchWord;
  //esasyil

  ModalBottomOnay({
    Key? key,
    //required this.press,
    //required this.searchWord,
  }) : super(key: key);

  @override
  State<ModalBottomOnay> createState() => _ModalBottomOnayState();
}

class _ModalBottomOnayState extends State<ModalBottomOnay> {
  @override
  Widget build(BuildContext context) {
    final List<String> kararDurumu = [
      'Hepsi',
      'Onaya Gönderildi',
      'Onaylandı',
      'Reddedildi',
    ];

    final textEditingController = TextEditingController();
    return Stack(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height / 15)),
          child: Container(
            alignment: Alignment.topCenter,
            child: const Text('Kullanıcı Karar Sorgulama',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 8,
              right: MediaQuery.of(context).size.width / 25,
              left: MediaQuery.of(context).size.width / 25,
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Esas Numarası'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Karar Numarası'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Karar'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Hüküm'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Avukat Değerlendirmesi'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Karar Durumu'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(
                    items: kararDurumu,
                    color_of_box: Color.fromARGB(255, 255, 255, 255),
                    color_of_text: Colors.black,
                    height_of_box: 45,
                    size_of_font: 12,
                    width_of_box: 360,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text('Karar Aralığı'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            hintText: 'Başlangıç Tarihi',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.height / 50),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            hintText: 'Bitiş Tarihi',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(150, 45),
                            backgroundColor:
                                const Color.fromARGB(255, 194, 27, 5)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Vazgeç',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(150, 45),
                            backgroundColor:
                                const Color.fromARGB(255, 1, 28, 63)),
                        onPressed: () {},
                        child: const Text(
                          'Sorgula',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
