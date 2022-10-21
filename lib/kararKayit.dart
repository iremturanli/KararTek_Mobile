import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class kararKayit extends StatefulWidget {
  kararKayit({
    Key? key,
  }) : super(key: key);

  @override
  State<kararKayit> createState() => _kararKayitState();
}

class _kararKayitState extends State<kararKayit> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Karar Kayıt',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
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
                  labelText: 'Daire / Kurul Adı',
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
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
                    labelText: 'Mahkeme*',
                    labelStyle: const TextStyle(color: Colors.black)),
              )),
          const SizedBox(height: 31),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                minLines: 3,
                maxLines: null,
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
                    labelText: 'Hüküm',
                    alignLabelWithHint: true,
                    labelStyle: const TextStyle(color: Colors.black)),
              )),
          const SizedBox(height: 31),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                minLines: 3,
                maxLines: null,
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
                    labelText: 'Avukat Değerlendirmesi',
                    alignLabelWithHint: true,
                    labelStyle: const TextStyle(color: Colors.black)),
              )),
          const SizedBox(height: 31),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
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
                    labelText: 'Dava Türü',
                    labelStyle: const TextStyle(color: Colors.black)),
              )),
        ],
      ),
    );
  }
}
