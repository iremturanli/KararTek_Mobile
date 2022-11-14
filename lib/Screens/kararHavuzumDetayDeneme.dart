import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KararHavuzumDetayDeneme extends StatefulWidget {
  final int ListIndex;
  List<Map<String, dynamic>> List_;

  KararHavuzumDetayDeneme(
      {Key? key, required this.ListIndex, required this.List_})
      : super(key: key);

  @override
  State<KararHavuzumDetayDeneme> createState() =>
      _KararHavuzumDetayDenemeState();
}

class _KararHavuzumDetayDenemeState extends State<KararHavuzumDetayDeneme> {
  bool isSelected = false;
  int likeCounter = 0;
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
      bottomNavigationBar: Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height / 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                tooltip: 'Beğen',
                icon: !isSelected
                    ? const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 30,
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  if (isSelected) {
                    likeCounter++;
                    Fluttertoast.showToast(msg: "$likeCounter beğeni");
                  } else {
                    likeCounter--;
                    Fluttertoast.showToast(msg: 'Beğeni geri çekildi.');
                  }
                },
              ),
              IconButton(
                tooltip: 'İndir',
                icon: const Icon(
                  Icons.download,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Fluttertoast.showToast(msg: "Belge indiriliyor.");
                },
              ),
            ],
          )),
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
                '${widget.List_[widget.ListIndex]["esasSıraNo"]}/${widget.List_[widget.ListIndex]["esasYılı"]}',
              ),
              CustomDivider(),
              Text('Mahkeme',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${widget.List_[widget.ListIndex]["Mahkeme"]}',
              ),
              CustomDivider(),
              Text('Hüküm',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${widget.List_[widget.ListIndex]["Hüküm"]}',
              ),
              CustomDivider(),
              Text('Karar',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${widget.List_[widget.ListIndex]["Karar"]}',
              ),
              CustomDivider()
            ])),
      ),
    );
  }
}
