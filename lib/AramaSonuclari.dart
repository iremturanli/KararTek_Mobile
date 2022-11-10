import 'package:flutter/material.dart';
import 'package:flutter_application_1/AramaSonuclariDetay.dart';
import 'package:flutter_application_1/AramaSonuclariDetayDeneme.dart';
import 'package:flutter_application_1/kararArama.dart';
import 'package:flutter_application_1/widgets/comboBox.dart';
import 'package:hexcolor/hexcolor.dart';

class AramaSonuclari extends StatefulWidget {
  List<Map<String, dynamic>> _bulunanKararlar;
  AramaSonuclari(this._bulunanKararlar, {Key? key}) : super(key: key);

  @override
  State<AramaSonuclari> createState() => _AramaSonuclariState();
}

class _AramaSonuclariState extends State<AramaSonuclari> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //print(widget._bulunanKararlar);
  }

  final List<String> _daire = [
    '1.Ceza Dairesi',
    '2.Ceza Dairesi',
  ];

  final List<String> _mahkeme = [
    '1.Ağır Ceza Mahkemesi',
    '2.Ağır Ceza Mahkemesi',
  ];

  final List<String> _siralama = [
    'Karar Tarihine Göre',
    'Beğeni Sayısına Göre',
    'İndirme Sayısına Göre',
    'Görüntülenme Sayısına Göre',
    'Hepsi'
  ];

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Arama Sonuçları',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: <Widget>[
          widget._bulunanKararlar.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: Icon(Icons.filter_alt_outlined))
              : const Text('')
        ],
      ),
      endDrawer: Drawer(
        //generiic
        backgroundColor: HexColor('#E0EAF8'),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 15,
              right: MediaQuery.of(context).size.height / 50,
              left: MediaQuery.of(context).size.height / 50,
              bottom: MediaQuery.of(context).size.height / 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Filtrele',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              const Text(
                'Daire',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              ComboBox(items: _daire),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const Text(
                'Mahkeme',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              ComboBox(items: _mahkeme),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const Text(
                'Sıralama',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              ComboBox(items: _siralama),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const Text(
                'Kelime',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              TextFormField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(
                      width: 1,
                      color: const Color.fromARGB(255, 189, 189, 189),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              Center(
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    label: const Text(
                      "Sorgula",
                      style: TextStyle(fontSize: 17.5),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        minimumSize: const Size(250, 50),
                        backgroundColor: const Color.fromARGB(255, 1, 28, 63))),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              //sizedBox
              height: height / 2,
              width: width,
              child: widget._bulunanKararlar.isNotEmpty
                  ? ListView.builder(
                      itemCount: widget._bulunanKararlar.length,
                      itemBuilder: ((context, index) => Card(
                            color: const Color.fromARGB(255, 247, 246, 246),
                            elevation: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 16,
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 28, 63),
                                  child: Text(
                                    widget._bulunanKararlar[index]["id"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                              title: Text(
                                "${widget._bulunanKararlar[index]["Kurul Adı"]}-${widget._bulunanKararlar[index]["kararSıraNo"]}/${widget._bulunanKararlar[index]["kararYılı"]}",
                              ),
                              subtitle: Text(
                                '${widget._bulunanKararlar[index]["Karar"]}',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AramaSonuclariDetayDeneme(
                                                List_: widget._bulunanKararlar,
                                                ListIndex: index)));
                              }),
                            ),
                          )))
                  : const Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.search_off,
                            color: Colors.black,
                          )),
                      label: Text(
                        'Sonuç Bulunamadı',
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
        ],
      )),
    );
  }
}


// Container(
//         child: widget._foundUsers.isNotEmpty
//             ? Padding(
//                 padding: const EdgeInsets.only(top: 70.0),
//                 child: ListView.builder(
//                   itemCount: widget._foundUsers.length,
//                   itemBuilder: (context, index) => Card(
//                     key: ValueKey(widget._foundUsers[index]["id"]),
//                     color: Color.fromARGB(255, 223, 228, 236),
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 7),
//                     child: ListTile(
//                       leading: Text(
//                         widget._foundUsers[index]["id"].toString(),
//                         style: const TextStyle(
//                             color: Color.fromARGB(255, 1, 28, 63),
//                             fontSize: 25,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       title: Text(widget._foundUsers[index]['name']),
//                       subtitle: Text(
//                           '${widget._foundUsers[index]["age"].toString()} years old'),
//                       onTap: (() {
//                         Navigator.of(context).pop(KararArama());
//                       }),
//                     ),
//                   ),
//                 ),
//               )
//             : const Text(
//                 'Sonuç bulunamadı',
//                 //  style: TextStyle(fontSize: 24),
//               ),
//         // child: Text(widget._foundUsers.toString()),
//       )