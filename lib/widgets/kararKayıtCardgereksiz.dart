import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/KararOnayDetay.dart';
import 'package:flutter_application_1/Screens/kaydettigimKararlarDetay.dart';

import '../Screens/kaydettigimKararlarDetay.dart';

class CardDataKayitliKarar extends StatelessWidget {
  final int ListIndex;
  final String param1;
  final String? param2;
  final List<Map<String, dynamic>> List_;
  const CardDataKayitliKarar(
      {Key? key,
      required this.ListIndex,
      required this.param1,
      required this.List_,
      required this.param2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => KaydettigimKararDetay(
                      List_: List_,
                      ListIndex: ListIndex,
                    )));
      }),
      child: Container(
          padding: EdgeInsets.all(height / 50),
          child: param2 == null
              ? Text(
                  '${List_[ListIndex][param1]}',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )
              : Text(
                  "${List_[ListIndex][param1]}/${List_[ListIndex][param2]}",
                  style: TextStyle(fontSize: 15),
                )),
    );
  }
}
