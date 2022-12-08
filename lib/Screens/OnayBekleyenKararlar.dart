// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/ModalBottomOnay.dart';
import 'package:flutter_application_1/widgets/KararListCard.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../AppConfigurations/appConfigurations.dart';

import '../models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import '../services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import 'KararOnayDetay.dart';

class OnayBekleyenKararlar extends StatefulWidget {
  const OnayBekleyenKararlar({Key? key}) : super(key: key);

  @override
  State<OnayBekleyenKararlar> createState() => _OnayBekleyenKararlarState();
}

class _OnayBekleyenKararlarState extends State<OnayBekleyenKararlar> {
  @override
  void initState() {
    getAllLawyerJudgments();
  }

  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();

  List<LawyerJudgmentListInformation> pendingApprovalJudgments = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Onay Bekleyen Kararlar',
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
                      builder: (BuildContext context) =>
                          Home() //ModalBottomOnay(),
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text("Esas No"),
                  Text("Karar No"),
                  Text("Karar Durumu"),
                ],
              ),
              CustomDivider(),
              SizedBox(
                //container
                height: height / 2,
                width: width,
                child: ListView.builder(
                  //<-- SEE HERE
                  itemCount: pendingApprovalJudgments.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 4,
                    color: const Color.fromARGB(229, 229, 229, 229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KararDetay(
                                      ListIndex: index,
                                      pendingApprovalJudgments:
                                          pendingApprovalJudgments,
                                    )));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardData(
                            param1: pendingApprovalJudgments[index].meritsNo,
                            param2: pendingApprovalJudgments[index].meritsYear,
                          ),
                          SizedBox(width: height / 40), //?????
                          CardData(
                            param1: pendingApprovalJudgments[index].decreeNo,
                            param2: pendingApprovalJudgments[index].decreeYear,
                          ),
                          Chip(
                            labelPadding: EdgeInsets.all(1.0),
                            label: Text(
                              pendingApprovalJudgments[index].stateName!,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 1, 28, 63),
                            elevation: 6.0,
                            shadowColor: Colors.grey[60],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  getAllLawyerJudgments() async {
    try {
      SearchDataLawyerResponse response =
          await lawyerJudgmentService.getAllLawyerJudgments();
      if (response.success == true) {
        pendingApprovalJudgments.clear();
        pendingApprovalJudgments.addAll(response.data!);
        print(response.success);
        setState(() {});

        print(response);
      } else {
        print(response.message);
      }
    } catch (e) {
      print(e);
    }
  }
}
