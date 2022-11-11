import 'package:flutter/material.dart';
import 'comboBox.dart';
import 'comboBoxLarge.dart';

class ModalBottomAramaSonuclari extends StatefulWidget {
  ModalBottomAramaSonuclari({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalBottomAramaSonuclari> createState() =>
      _ModalBottomAramaSonuclari();
}

final List<String> _daire = [
  '1.Ceza Dairesi',
  '2.Ceza Dairesi',
];

final List<String> _mahkeme = [
  '1.Ağır Ceza Mahkemesi',
  '2.Ağır Ceza Mahkemesi',
];

final List<String> _siralama = [
  'Karar Tarihine Göre',
  'Beğeni Sayısına Göre',
  'İndirme Sayısına Göre',
  'Görüntülenme Sayısına Göre',
  'Hepsi'
];

class _ModalBottomAramaSonuclari extends State<ModalBottomAramaSonuclari> {
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
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 40,
              right: MediaQuery.of(context).size.width / 25,
              left: MediaQuery.of(context).size.width / 25,
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: Text(
                      'Filtrele',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(
                    'Kelime',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  TextFormField(
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
                  const Text(
                    'Daire',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(items: _daire),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text(
                    'Mahkeme',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(items: _mahkeme),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text(
                    'Sıralama',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(items: _siralama),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height / 80),
                  Center(
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.search),
                        label: const Text(
                          "Sorgula",
                          style: TextStyle(fontSize: 17.5),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(100, 40),
                            backgroundColor:
                                const Color.fromARGB(255, 1, 28, 63))),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
