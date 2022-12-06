// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'comboBox.dart';

class ModalBottom extends StatefulWidget {
  final VoidCallback press;
  final TextEditingController searchWord;
  //esasyil

  const ModalBottom({
    Key? key,
    required this.press,
    required this.searchWord,
  }) : super(key: key);

  @override
  State<ModalBottom> createState() => _ModalBottomState();
}

class _ModalBottomState extends State<ModalBottom> {
  @override
  Widget build(BuildContext context) {
    final List<String> kararTuru = [
      'Yargıtay Kararı',
      'Danıştay Kararı',
      'Avukat Tarafından Yüklenen',
    ];
    final List<String> mahkeme = [
      'Anayasa Mahkemesi',
    ];
    final textEditingController = TextEditingController();
    return Stack(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height / 15)),
          child: Container(
            alignment: Alignment.topCenter,
            child: const Text('Detaylı Arama',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                  const Text('Kelime ile Arama'),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  TextFormField(
                    controller: widget.searchWord,
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
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  const Text('Karar Türü'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(
                    items: kararTuru,
                    color_of_box: const Color.fromARGB(255, 255, 255, 255),
                    color_of_text: Colors.black,
                    height_of_box: 55,
                    size_of_font: 12,
                    width_of_box: 360,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  const Text('Daire'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(
                    items: mahkeme,
                    color_of_box: const Color.fromARGB(255, 255, 255, 255),
                    color_of_text: Colors.black,
                    height_of_box: 55,
                    size_of_font: 12,
                    width_of_box: 360,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  const Text('Mahkeme'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(
                    items: mahkeme,
                    color_of_box: const Color.fromARGB(255, 255, 255, 255),
                    color_of_text: Colors.black,
                    height_of_box: 55,
                    size_of_font: 12,
                    width_of_box: 360,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),

                  const Text('Esas Numarası'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            hintText: 'Esas Yılı',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            hintText: 'İlk Sıra No',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            hintText: 'Son Sıra No',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  const Text('Karar Numarası'),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            hintText: 'Karar Yılı',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            hintText: 'İlk Sıra No',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            hintText: 'Son Sıra No',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  const Text('Karar Aralığı'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            hintText: 'Başlangıç Tarihi',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 189, 189),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          )),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.height / 50),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                          child: TextFormField(
                              decoration: const InputDecoration(
                            hintText: 'Bitiş Tarihi',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 189, 189),
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
                        onPressed: widget.press,
                        child: const Text(
                          'Arama Yap',
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
