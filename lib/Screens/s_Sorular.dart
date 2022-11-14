import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class sSorular extends StatefulWidget {
  const sSorular({Key? key}) : super(key: key);
  @override
  State<sSorular> createState() => _sSorularState();
}

class _sSorularState extends State<sSorular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sıkça Sorulan Sorular',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
        child: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 80),
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text(
              'Girişini yaptığım anahtar kelimelerin yazdığım sıra ile birlikte içinde bulunduğu kararları nasıl sorgulayabilirim?',
              style: TextStyle(
                  color: _customTileExpanded ? Colors.black : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const ListTile(
                  title: Text(
                      'Karartek arama çubuğuna girişini yaptığınız anahtar kelimeleri tırnak (") işareti içinde yazmanız halinde, yazdığınız anahtar kelimelerin yazdığınız sıra ile birlikte bulunduğu kararlar arama sonucu olarak listelenecektir.')),
            ],
          ),
          const Divider(
            height: 0,
            thickness: 0.5,
            color: Colors.grey,
          ),
          ExpansionTile(
            title: Text(
              'Yapacağım aramanın sadece bir önceki anahtar kelime ile sorgulanan sonuçlar içinde yapılmasını nasıl sağlayabilirim?',
              style: TextStyle(
                  color: _customTileExpanded ? Colors.black : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const ListTile(
                  title: Text(
                      'Arama çubuğuna herhangi bir anahtar kelime girişi yaparak sorgulama yaptığınızda bulunan kararlar listelenecektir. Bu listenin üst kısmında, (arama filtrelerinin altında) yeni bir arama çubuğu açılmaktadır. Bu arama çubuğuna yazacağınız yeni anahtar kelime ya da kelimeler sadece ilk yazdığınız anahtar kelime ile yapılan arama sonucunda listelenen kararlar içinde aranacaktır.')),
            ],
          ),
        ],
      ),
    );
  }
}
