// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/models/EJudgmentState.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/judgmentApprovalDto.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/KararRedPopUp.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../AppConfigurations/appConfigurations.dart';
import '../services/LawyerJudgmentServices/LawyerJudgmentService.dart';

// ignore: must_be_immutable
class KararDetay extends StatefulWidget {
  LawyerJudgmentListInformation pendingApprovalJudgments;
  // ignore: non_constant_identifier_names

  KararDetay(
      {Key? key,
      // ignore: non_constant_identifier_names

      required this.pendingApprovalJudgments})
      : super(key: key);

  @override
  State<KararDetay> createState() => _KararDetayState();
}

class _KararDetayState extends State<KararDetay> {
  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();

  TextEditingController rejectMessage = TextEditingController();

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
              '${widget.pendingApprovalJudgments.meritsNo}/${widget.pendingApprovalJudgments.meritsYear}',
            ),
            const CustomDivider(),
            const Text('Kurul Adı',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
              '${widget.pendingApprovalJudgments.commissionName}',
            ),
            const CustomDivider(),
            const Text('Mahkeme',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
                '${widget.pendingApprovalJudgments.courtName}'),
            const CustomDivider(),
            const Text('Hüküm',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text('${widget.pendingApprovalJudgments.decree}'),
            const CustomDivider(),
            const Text('Avukat Açıklaması',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
                '${widget.pendingApprovalJudgments.lawyerAssesment}'),
            const CustomDivider(),
            const Text('Karar',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
                '${widget.pendingApprovalJudgments.decision}'),
            const CustomDivider(),
            const Text('Karar Tarihi',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
                '${widget.pendingApprovalJudgments.judgmentDate}'),
            const CustomDivider(),
            const Text('Kayıt Tarihi',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
                '${widget.pendingApprovalJudgments.createDate}'),
            const CustomDivider(),
            const Text("TBB'ye Gönderilme Tarihi",
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
                '${widget.pendingApprovalJudgments.createDate}'),
            const CustomDivider(),
            const Text('Kararı Ekleyen Kişi',
                style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Text(
                '${widget.pendingApprovalJudgments.userName} ${widget.pendingApprovalJudgments.lastName}'),
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
                                                  content: OnayPopUp(
                                                    rejectMessage:
                                                        rejectMessage,
                                                  ), // tekrar bak!!
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
                                                              ApproveJudgment(ApproveJudgmentDto(
                                                                  id: widget
                                                                      .pendingApprovalJudgments
                                                                         
                                                                      .id,
                                                                  stateId:
                                                                      EJudgmentState
                                                                          .Reddedildi,
                                                                  rejectMessage:
                                                                      rejectMessage
                                                                          .text));
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
                                        ApproveJudgment(
                                          ApproveJudgmentDto(
                                              id: widget
                                                  .pendingApprovalJudgments
                                                     
                                                  .id,
                                              stateId:
                                                  EJudgmentState.Onaylandi),
                                        );
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

  ApproveJudgment(ApproveJudgmentDto approveJudgmentDto) async {
    MobileApiResponse response =
        await lawyerJudgmentService.approveJudgment(approveJudgmentDto);
    if (response.hasError == false) {
      Fluttertoast.showToast(
          msg: "İşlem Başarılı!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(response.errorMessage);
    }
  }
}
