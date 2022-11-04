import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';

class KararHavuzumDetay extends StatelessWidget {
  final int ListIndex;
  List<Map<String, dynamic>> List_;

  KararHavuzumDetay({Key? key, required this.ListIndex, required this.List_})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text('Karar Havuzum ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Esas No',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${List_[ListIndex]["esasNo"]}',
              ),
              CustomDivider(),
              Text('Mahkeme',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${List_[ListIndex]["Mahkeme"]}',
              ),
              CustomDivider(),
              Text('Hüküm',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${List_[ListIndex]["Hüküm"]}',
              ),
              CustomDivider(),
              Text('Karar',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${List_[ListIndex]["Karar"]}',
              ),
              CustomDivider()
            ])),
      ),
    );
  }
}
