import 'package:flutter/material.dart';
import 'comboBox.dart';

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
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  const Text(
                    'Daire',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(
                    items: _daire,
                    color_of_box: const Color.fromARGB(255, 255, 255, 255),
                    color_of_text: Colors.black,
                    height_of_box: 55,
                    size_of_font: 12,
                    width_of_box: 360,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  const Text(
                    'Mahkeme',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(
                      items: _mahkeme,
                      color_of_box: const Color.fromARGB(255, 255, 255, 255),
                      color_of_text: Colors.black,
                      height_of_box: 55,
                      size_of_font: 12,
                      width_of_box: 360),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  const Text(
                    'Sıralama',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  ComboBox(
                      items: _siralama,
                      color_of_box: const Color.fromARGB(255, 255, 255, 255),
                      color_of_text: Colors.black,
                      height_of_box: 55,
                      size_of_font: 12,
                      width_of_box: 360),
                  SizedBox(height: MediaQuery.of(context).size.height / 85),
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(100, 40),
                            backgroundColor:
                                const Color.fromARGB(255, 1, 28, 63))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
