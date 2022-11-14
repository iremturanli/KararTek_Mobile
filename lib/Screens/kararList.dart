import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AvukatKararToplam.dart';
import 'package:flutter_application_1/Screens/KararHavuzum.dart';
import 'package:flutter_application_1/Screens/KaydettigimKararlar.dart';
import 'package:flutter_application_1/Screens/OnayBekleyenKararlar.dart';
import 'package:flutter_application_1/Screens/iletisimBilgileri.dart';
import 'package:flutter_application_1/Screens/kararKayit.dart';
import 'package:flutter_application_1/Screens/s_Sorular.dart';

import '../widgets/menu.dart';

final List<Map<String, dynamic>> _kararIslemleri = [
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.add_comment_sharp,
    "content": "Yeni Karar Kaydı"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.edit,
    "content": "Karar Havuzum"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.saved_search,
    "content": "Kaydettiğim Kararlar"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.approval_outlined,
    "content": "Onay Bekleyen Kararlar"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.analytics_outlined,
    "content": "Avukat Karar Toplamları"
  }
];

class kararList extends StatelessWidget {
  const kararList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Karar İşlemleri',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
          child: ListView.builder(
              itemCount: _kararIslemleri.length,
              itemBuilder: ((context, index) => Menu(
                  press: (() {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => kararKayit(),
                          ),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KararHavuzum(),
                          ),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KaydettigimKararlar(),
                          ),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnayBekleyenKararlar(),
                          ),
                        );
                        break;
                      case 4:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvukatKararToplam(),
                          ),
                        );
                        break;
                    }
                  }),
                  labelText: _kararIslemleri[index]["content"],
                  iconTrailing: _kararIslemleri[index]["trailing"],
                  iconLeading: _kararIslemleri[index]["leading"]))),
        ));
  }
}
