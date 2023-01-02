// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/mobileApiResponse.dart';
import 'package:flutter_application_1/Screens/KararHavuzum.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentListInformation.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/services/FavouriteJudgmentService/favouriteJudgmentService.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../AppConfigurations/appConfigurations.dart';
import '../models/UserTypeInformation/ESearchTypes.dart';

class KararHavuzumDetay extends StatefulWidget {
  JudgmentListInformation? judgments;
  LawyerJudgmentListInformation? lawyerJudgments;

  KararHavuzumDetay({Key? key, this.judgments, this.lawyerJudgments})
      : super(key: key);

  @override
  State<KararHavuzumDetay> createState() => _KararHavuzumDetayState();
}

final FavouriteJudgmentService favouriteJudgmentService =
    getIt.get<FavouriteJudgmentService>();

class _KararHavuzumDetayState extends State<KararHavuzumDetay> {
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
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Karar Detayı ',
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
              const Text('Esas No',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              widget.judgments != null
                  ? Visibility(
                      visible: true,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.judgments?.meritsNo}/${widget.judgments?.meritsYear}',
                            ),
                            const CustomDivider(),
                            const Text('Mahkeme',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text(
                              '${widget.judgments?.courtName}',
                            ),
                            const CustomDivider(),
                            const Text('Hüküm',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text(
                              '${widget.judgments?.decree}',
                            ),
                            const CustomDivider(),
                            const Text('Karar',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text(
                              '${widget.judgments?.decision}',
                            ),
                            const CustomDivider(),
                            const Text('Karar Tarihi',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text(
                              '${widget.judgments?.judgmentDate}',
                            ),
                            const CustomDivider(),
                            const Text('Karar Türü',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text('${widget.judgments?.judgmentTypeName}'),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 2.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () {
                                      deleteFromJudgmentPool(
                                          widget.judgments!.id!,
                                          ESearchTypes.YuksekYargiKararlari);
                                    },
                                    icon: const Icon(Icons.delete),
                                    label: const Text(
                                      "Sil",
                                      style: TextStyle(fontSize: 17.5),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        minimumSize: const Size(200, 40),
                                        backgroundColor:
                                            Color.fromARGB(255, 194, 27, 5))),
                              ],
                            ),
                          ]))
                  : Visibility(
                      visible: true,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.lawyerJudgments?.meritsNo}/${widget.lawyerJudgments?.meritsYear}',
                            ),
                            const CustomDivider(),
                            const Text('Mahkeme',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text(
                              '${widget.lawyerJudgments?.courtName}',
                            ),
                            const CustomDivider(),
                            const Text('Hüküm',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text(
                              '${widget.lawyerJudgments?.decree}',
                            ),
                            const CustomDivider(),
                            const Text('Avukat Değerlendirmesi',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text(
                              '${widget.lawyerJudgments?.lawyerAssesment}',
                            ),
                            const CustomDivider(),
                            const Text('Karar',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text('${widget.lawyerJudgments?.decision}'),
                            const CustomDivider(),
                            const Text('Karar Tarihi',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text('${widget.lawyerJudgments?.judgmentDate}'),
                            const CustomDivider(),
                            const Text('Kararı Ekleyen Kişi',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 17)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100),
                            Text(
                                '${widget.lawyerJudgments?.userName} ${widget.lawyerJudgments?.lastName}'),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 85),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () {
                                      deleteFromJudgmentPool(
                                          widget.lawyerJudgments!.id!,
                                          ESearchTypes
                                              .AvukatinEkledigiKararlar);
                                    },
                                    icon: const Icon(Icons.delete),
                                    label: const Text(
                                      "Kaldır",
                                      style: TextStyle(fontSize: 17.5),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        minimumSize: const Size(200, 40),
                                        backgroundColor:
                                            Color.fromARGB(255, 194, 27, 5))),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 190),
                          ]))
            ])),
      ),
    );
  }

  deleteFromJudgmentPool(int id, int searchTypeId) async {
    MobileApiResponse response =
        await favouriteJudgmentService.deleteFromJudgmentPool(id, searchTypeId);
    if (response.hasError == false) {
      Fluttertoast.showToast(msg: "Karar Başarıyla Kaldırıldı.");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const KararHavuzum()));
    }
  }
}
