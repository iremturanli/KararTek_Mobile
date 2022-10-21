import 'package:flutter/material.dart';
import 'package:flutter_application_1/kararKayit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class kararIslemleri extends StatelessWidget {
  const kararIslemleri({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Karar İşlemleri',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => kararKayit()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 150.0),
                    child: Text(
                      'Yeni Karar Kaydı',
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
                    onPressed: _showToast,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 153.0),
                      child: const Text(
                        'Karar Havuzum',
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      ),
                    ))
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
                    onPressed: _showToast,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 110.0),
                      child: const Text(
                        'Kaydettiğim Kararlar',
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      ),
                    ))
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
                    onPressed: _showToast,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 90.0),
                      child: const Text(
                        'Onay Bekleyen Kararlar',
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      ),
                    ))
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
                    onPressed: _showToast,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 85.0),
                      child: const Text(
                        'Avukat Karar Toplamları',
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showToast() => Fluttertoast.showToast(
        msg: 'Button Tapped',
      );
}
