import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/KararRedPopUp.dart';
import 'package:flutter_application_1/widgets/KararListCard.dart';

class KararDetay extends StatelessWidget {
  List<LawyerJudgmentListInformation> pendingApprovalJudgments = [];
  // ignore: non_constant_identifier_names
  final int ListIndex;
  KararDetay(
      {Key? key,
      required this.ListIndex,
      required this.pendingApprovalJudgments})
      : super(key: key);

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
        iconTheme: const IconThemeData(color: Colors.black),
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
            const Text('Esas No',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
              '${pendingApprovalJudgments[ListIndex].meritsNo}/${pendingApprovalJudgments[ListIndex].meritsYear}',
            ),
            const CustomDivider(),
            const Text('Kurul Adı',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
              '${pendingApprovalJudgments[ListIndex].commissionName}',
            ),
            const CustomDivider(),
            const Text('Mahkeme',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${pendingApprovalJudgments[ListIndex].courtName}'),
            const CustomDivider(),
            const Text('Hüküm',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${pendingApprovalJudgments[ListIndex].decree}'),
            const CustomDivider(),
            const Text('Avukat Açıklaması',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${pendingApprovalJudgments[ListIndex].lawyerAssesment}'),
            const CustomDivider(),
            const Text('Karar',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${pendingApprovalJudgments[ListIndex].decision}'),
            const CustomDivider(),
            const Text('Karar Tarihi',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${pendingApprovalJudgments[ListIndex].judgmentDate}'),
            const CustomDivider(),
            const Text('Kayıt Tarihi',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${pendingApprovalJudgments[ListIndex].createDate}'),
            const CustomDivider(),
            const Text("TBB'ye Gönderilme Tarihi",
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${pendingApprovalJudgments[ListIndex].createDate}'),
            const CustomDivider(),
            const Text('Kararı Ekleyen Kişi',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
                '${pendingApprovalJudgments[ListIndex].userName} ${pendingApprovalJudgments[ListIndex].lastName}'),
            const CustomDivider(),
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height / 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: const Size(350, 50),
                  backgroundColor: const Color.fromARGB(255, 1, 28, 63),
                ),
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (ctx) => AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 221, 226, 241),
                            shape: const RoundedRectangleBorder(
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
                                          minimumSize: const Size(120, 50),
                                          backgroundColor: const Color.fromARGB(
                                              255, 194, 27, 5),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 221, 226, 241),
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30))),
                                                  title: const Text(
                                                      "Kararı reddetme sebebiniz nedir?"),
                                                  content: const OnayPopUp(),
                                                  actions: <Widget>[
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                minimumSize:
                                                                    const Size(
                                                                        120,
                                                                        50),
                                                                backgroundColor:
                                                                    const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        175,
                                                                        172,
                                                                        172),
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10)))),
                                                            onPressed: () {
                                                              Navigator.of(ctx)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                              "İPTAL",
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                minimumSize:
                                                                    const Size(
                                                                        120,
                                                                        50),
                                                                backgroundColor:
                                                                    const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        194,
                                                                        27,
                                                                        5),
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10)))),
                                                            onPressed: () {
                                                              Navigator.of(ctx)
                                                                  .pop();
                                                            },
                                                            child: const Text(
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
                                      child: const Text(
                                        "REDDET",
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(120, 50),
                                          backgroundColor: const Color.fromARGB(
                                              255, 130, 184, 113),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text(
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
