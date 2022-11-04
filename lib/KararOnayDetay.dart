import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/KararRedPopUp.dart';
import 'package:flutter_application_1/widgets/KararListCard.dart';

class KararDetay extends StatelessWidget {
  List<Map<String, dynamic>> List_;
  final int ListIndex;
  KararDetay({
    required this.List_,
    Key? key,
    required this.ListIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text('Karar Detay',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Esas No',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
              '${List_[ListIndex]["esasSıraNo"]}/${List_[ListIndex]["esasYılı"]}',
            ),
            CustomDivider(),
            Text('Kurul Adı',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
              '${List_[ListIndex]["Kurul Adı"]}',
            ),
            CustomDivider(),
            Text('Mahkeme',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${List_[ListIndex]["Mahkeme"]}'),
            CustomDivider(),
            Text('Hüküm',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${List_[ListIndex]["Hüküm"]}'),
            CustomDivider(),
            Text('Avukat Açıklaması',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${List_[ListIndex]["Avukat Açıklaması"]}'),
            CustomDivider(),
            Text('Karar',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${List_[ListIndex]["Karar"]}'),
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
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height / 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: Size(350, 50),
                  backgroundColor: Color.fromARGB(255, 1, 28, 63),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            backgroundColor: Color.fromARGB(255, 221, 226, 241),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            title: const Text(
                                "Karar hakkında yapmak istediğiniz işlemi seçiniz."),
                            actions: <Widget>[
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(120, 50),
                                          backgroundColor:
                                              Color.fromARGB(255, 194, 27, 5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 221, 226, 241),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  title: const Text(
                                                      "Kararı onaylamak istediğinizden emin misiniz?"),
                                                  content: OnayPopUp(),
                                                  actions: <Widget>[
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                minimumSize:
                                                                    Size(120,
                                                                        50),
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        175,
                                                                        172,
                                                                        172),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10)))),
                                                            onPressed: () {
                                                              Navigator.of(ctx)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              "İPTAL",
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                minimumSize:
                                                                    Size(120,
                                                                        50),
                                                                backgroundColor:
                                                                    Color
                                                                        .fromARGB(
                                                                            255,
                                                                            194,
                                                                            27,
                                                                            5),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10)))),
                                                            onPressed: () {
                                                              Navigator.of(ctx)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              "REDDET",
                                                            ),
                                                          ),
                                                        ]),
                                                    SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            40),
                                                  ],
                                                ));
                                      },
                                      child: Text(
                                        "REDDET",
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(120, 50),
                                          backgroundColor: Color.fromARGB(
                                              255, 130, 184, 113),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Text(
                                        "ONAYLA",
                                      ),
                                    ),
                                  ]),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40),
                            ],
                          ));
                },
                child: const Text(
                  'İşlemler',
                  style: TextStyle(fontSize: 19),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
