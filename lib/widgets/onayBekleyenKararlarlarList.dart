import 'package:flutter/material.dart';
import 'package:flutter_application_1/KararOnayDetay.dart';

class CardData extends StatelessWidget {
  final int ListIndex;
  final String parameters;
  final List<Map<String, dynamic>> List_;
  const CardData(
      {Key? key,
      required this.ListIndex,
      required this.parameters,
      required this.List_})
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
                builder: (context) => KararDetay(
                      List_: List_,
                      ListIndex: ListIndex,
                    )));
      }),
      child: Container(
        padding: EdgeInsets.all(height / 50),
        child: Text(
          '${List_[ListIndex][parameters]}',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
