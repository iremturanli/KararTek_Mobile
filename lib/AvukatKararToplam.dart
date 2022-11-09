import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/ModalBottomOnay.dart';
import 'package:flutter_application_1/widgets/KararListCard.dart';
import 'package:flutter_application_1/widgets/comboBox.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'kararHavuzumDetay.dart';

final List<Map<String, dynamic>> _avukatKararToplam = [
  {
    "id": 1,
    "Ad": "İrem",
    "Soyad": "Turanlı",
    "Şehir": "Ankara",
    "Eklenen Karar Toplamı": "2",
  },
  {
    "id": 2,
    "Ad": "Berkay",
    "Soyad": "Demir",
    "Şehir": "Ankara",
    "Eklenen Karar Toplamı": "5",
  },
  {
    "id": 3,
    "Ad": "Işıl",
    "Soyad": " Bardakcı",
    "Şehir": "Ankara",
    "Eklenen Karar Toplamı": "8",
  },
  {
    "id": 4,
    "Ad": "Hussain",
    "Soyad": "Elburki",
    "Şehir": "Ankara",
    "Eklenen Karar Toplamı": "3",
  },
];
// final List<String> _sehir = ["Adana", "...", "Düzce"]; //?

class AvukatKararToplam extends StatefulWidget {
  const AvukatKararToplam({Key? key}) : super(key: key);

  @override
  State<AvukatKararToplam> createState() => _AvukatKararToplamState();
}

class _AvukatKararToplamState extends State<AvukatKararToplam> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Avukat Karar Toplam',
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.visible),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.height / 2.5,
            child: TextField(
              decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: "Ara",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 252, 252, 252),
                  focusedBorder: OutlineInputBorder(
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 3.2),
            child: ElevatedButton.icon(
              icon: Icon(Icons.search),
              label: Text("Sorgula"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: Size(45, 30),
                  backgroundColor: const Color.fromARGB(255, 1, 28, 63)),
              onPressed: () => showMaterialModalBottomSheet<void>(
                expand: true,
                // backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) => ModalBottomOnay(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("Sıra"),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Text("Ad Soyad"),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Text("Şehir"),
              Text("Eklenen Karar Toplamı"),
            ],
          ),
          CustomDivider(),
          Container(
            height: height / 2,
            width: width,
            child: ListView.builder(
                itemCount: _avukatKararToplam.length,
                itemBuilder: ((context, index) => Card(
                      color: const Color.fromARGB(229, 229, 229, 229),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: height / 50),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 28, 63),
                              radius: 15,
                              child: Text('${_avukatKararToplam[index]['id']}',
                                  style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          Text(
                              '${_avukatKararToplam[index]["Ad"]} ${_avukatKararToplam[index]["Soyad"]}'),
                          Text('${_avukatKararToplam[index]["Şehir"]}'),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 20),
                          Padding(
                            padding: EdgeInsets.only(right: height / 8),
                            child: Text(
                                '${_avukatKararToplam[index]["Eklenen Karar Toplamı"]}'),
                          )
                        ],
                      ),
                    ))),
          ),
        ],
      )),
    );
  }
}
