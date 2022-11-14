import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';

class AramaSonuclariDetay extends StatelessWidget {
  List<Map<String, dynamic>> List_;
  final int ListIndex;

  AramaSonuclariDetay({Key? key, required this.List_, required this.ListIndex})
      : super(key: key);

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
        actions: [
          //generic
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Text(' Beğen'),
                    ],
                  )),
              PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                      Text(' İndir'),
                    ],
                  )),
              PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      Text(' Hızlı Erişim'),
                    ],
                  )),
            ];
          })
        ],
      ),
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
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(Icons.favorite, color: Colors.red)),
                ],
              ),
              Text(
                '${List_[ListIndex]["esasSıraNo"]}/${List_[ListIndex]["esasYılı"]}',
              ),
              const CustomDivider(),
              const Text('Mahkeme',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${List_[ListIndex]["Mahkeme"]}',
              ),
              const CustomDivider(),
              const Text('Hüküm',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${List_[ListIndex]["Hüküm"]}',
              ),
              const CustomDivider(),
              const Text('Karar',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${List_[ListIndex]["Karar"]}'),
              const CustomDivider(),
              const Text('Karar Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${List_[ListIndex]["Karar Tarihi"]}'),
              const CustomDivider(),
              const Text('Kayıt Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${List_[ListIndex]["Karar Tarihi"]}'),
              const CustomDivider()
            ])),
      ),
    );
  }
}
