import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';

class KaydettigimKararDetay extends StatelessWidget {
  List<Map<String, dynamic>> List_;
  final int ListIndex;
  KaydettigimKararDetay({
    Key? key,
    required this.ListIndex,
    required this.List_,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                '${List_[ListIndex]["esasSıraNo"]}/${List_[ListIndex]["esasYılı"]}',
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
              Text('Avukat Açıklaması',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${List_[ListIndex]["Avukat Açıklaması"]}'),
              CustomDivider(),
              Text('TBB Açıklaması', //????
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${List_[ListIndex]["TBB Açıklaması"]}'),
              CustomDivider(),
              Text('Karar',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${List_[ListIndex]["Karar"]}',
              ),
              CustomDivider(),
              Text('Karar Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${List_[ListIndex]["Karar Tarihi"]}'),
              CustomDivider(),
              Text('Kayıt Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${List_[ListIndex]["Kayıt Tarihi"]}'),
              CustomDivider(),
              Text("TBB'ye Gönderilme Tarihi",
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${List_[ListIndex]["TBB'ye Gönderilme Tarihi"]}'),
              CustomDivider(),
            ])),
      ),
    );
  }
}
