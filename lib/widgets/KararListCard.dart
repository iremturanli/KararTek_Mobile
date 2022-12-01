import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/KararOnayDetay.dart';

class CardData extends StatelessWidget {
  final String? param1;
  final String? param2;
  const CardData({
    Key? key,
    required this.param1,
    required this.param2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(height / 55),
        child: Text(
          "${param1}/${param2}",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ));
  }
}
