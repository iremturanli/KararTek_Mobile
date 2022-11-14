import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AramaSonuclariDetayDeneme extends StatefulWidget {
  List<Map<String, dynamic>> List_;
  final int ListIndex;

  AramaSonuclariDetayDeneme(
      {Key? key, required this.List_, required this.ListIndex})
      : super(key: key);

  @override
  State<AramaSonuclariDetayDeneme> createState() =>
      _AramaSonuclariDetayDenemeState();
}

class _AramaSonuclariDetayDenemeState extends State<AramaSonuclariDetayDeneme> {
  bool isLiked = false;
  bool isSaved = false;
  int likeCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Karar Ayrıntıları',
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
                icon: !isLiked
                    ? Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 30,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                  if (isLiked) {
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
                icon: Icon(
                  Icons.download,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Fluttertoast.showToast(msg: "Belge indiriliyor.");
                },
              ),
              IconButton(
                tooltip: 'Hızlı Erişime Ekle',
                icon: !isSaved
                    ? Icon(
                        Icons.bookmark_outline_sharp,
                        color: Color.fromARGB(255, 21, 145, 28),
                        size: 30,
                      )
                    : Icon(
                        Icons.bookmark_outlined,
                        color: Color.fromARGB(255, 21, 145, 28),
                        size: 30,
                      ),
                onPressed: () {
                  setState(() {
                    isSaved = !isSaved;
                  });
                  if (isSaved) {
                    Fluttertoast.showToast(msg: "Karar Havuzuna Kaydedildi.");
                  } else {
                    Fluttertoast.showToast(msg: 'Kaydetmen geri çekildi.');
                  }
                },
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Esas No',
                      style: TextStyle(
                          color: Color.fromARGB(255, 117, 117, 117),
                          fontSize: 17)),
                ],
              ),
              Text(
                '${widget.List_[widget.ListIndex]["esasSıraNo"]}/${widget.List_[widget.ListIndex]["esasYılı"]}',
              ),
              const CustomDivider(),
              const Text('Mahkeme',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${widget.List_[widget.ListIndex]["Mahkeme"]}',
              ),
              const CustomDivider(),
              const Text('Hüküm',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${widget.List_[widget.ListIndex]["Hüküm"]}',
              ),
              const CustomDivider(),
              const Text('Karar',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${widget.List_[widget.ListIndex]["Karar"]}'),
              const CustomDivider(),
              const Text('Karar Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${widget.List_[widget.ListIndex]["Karar Tarihi"]}'),
              const CustomDivider(),
              const Text('Kayıt Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${widget.List_[widget.ListIndex]["Karar Tarihi"]}'),
              const CustomDivider()
            ])),
      ),
    );
  }
}
