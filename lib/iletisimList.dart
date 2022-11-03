import 'package:flutter/material.dart';

import 'package:flutter_application_1/iletisimBilgileri.dart';
import 'package:flutter_application_1/s_Sorular.dart';
import 'package:flutter_application_1/widgets/menu.dart';

final List<Map<String, dynamic>> _iletisim = [
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.phone,
    "content": "İletişim Bilgileri"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.question_answer,
    "content": "Sıkça Sorulan Sorular"
  }
];

class iletisimList extends StatelessWidget {
  iletisimList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'İletişim',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
        child: ListView.builder(
            itemCount: _iletisim.length,
            itemBuilder: ((context, index) => Menu(
                press: (() {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const iletisimBilgileri(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const sSorular(),
                        ),
                      );
                      break;
                  }
                }),
                labelText: _iletisim[index]["content"],
                iconTrailing: _iletisim[index]["trailing"],
                iconLeading: _iletisim[index]["leading"]))),
      ),
    );
  }
}
