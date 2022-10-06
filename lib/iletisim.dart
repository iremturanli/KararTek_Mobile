import 'package:flutter/material.dart';
import 'package:flutter_application_1/iletisimBilgileri.dart';
import 'package:flutter_application_1/sSorular.dart';
import 'package:fluttertoast/fluttertoast.dart';

class iletisim extends StatelessWidget {
  const iletisim({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: const Text(
            'İletişim Bilgileri',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      minimumSize: Size(350, 50),
                      backgroundColor: Color.fromRGBO(225, 225, 225, 100)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => iletisimBilgileri()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 150.0),
                    child: Text(
                      'İletişim Bilgileri',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        minimumSize: Size(350, 50),
                        backgroundColor: Color.fromRGBO(225, 225, 225, 100)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => sSorular()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: const Text(
                        'Sıkça Sorulan Sorular',
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showToast() => Fluttertoast.showToast(
        msg: 'Button Tapped',
      );
}
