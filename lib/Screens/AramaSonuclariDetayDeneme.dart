// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/BaseApiResponse.dart';
import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/models/ForLikeInformation/forLikeDto.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/services/JudgmentServices/judgmentService.dart';
import 'package:flutter_application_1/services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../AppConfigurations/appConfigurations.dart';
import '../services/UserLikeServices/UserLikeService.dart';

class AramaSonuclariDetayDeneme extends StatefulWidget {
  List<LawyerJudgmentListInformation> judgments = [];
  List<LawyerJudgmentListInformation> likes = [];

  final int ListIndex;
  final int? searchTypeId;
  AramaSonuclariDetayDeneme(
      {Key? key,
      required this.judgments,
      required this.ListIndex,
      required this.searchTypeId})
      : super(key: key);

  @override
  State<AramaSonuclariDetayDeneme> createState() =>
      _AramaSonuclariDetayDenemeState();
}

class _AramaSonuclariDetayDenemeState extends State<AramaSonuclariDetayDeneme> {
  final JudgmentService judgmentService = getIt.get<JudgmentService>();
  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();
  final UserLikeService userLikeService = getIt.get<UserLikeService>();

  bool isVisible = false;
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
                icon: widget.judgments[widget.ListIndex].isLike!
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
                    isLiked = !widget.judgments[widget.ListIndex].isLike!;
                  });
                  widget.searchTypeId == 1
                      ? addLike(widget.judgments[widget.ListIndex].id!, isLiked)
                      : addLawyerJudgmentLike(
                          widget.judgments[widget.ListIndex].id!, isLiked);

                  if (isLiked) {
                    likeCounter++;
                    Fluttertoast.showToast(msg: "$likeCounter beğeni");
                  } else {
                    likeCounter--;
                    //
                    Fluttertoast.showToast(msg: 'Beğeni geri çekildi.');
                  }
                },
              ),
              IconButton(
                tooltip: 'İndir',
                // ignore: prefer_const_constructors
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
                    // ignore: prefer_const_constructors
                    ? Icon(
                        Icons.bookmark_outline_sharp,
                        color: const Color.fromARGB(255, 21, 145, 28),
                        size: 30,
                      )
                    // ignore: prefer_const_constructors
                    : Icon(
                        Icons.bookmark_outlined,
                        color: const Color.fromARGB(255, 21, 145, 28),
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
              const Text('Esas No',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              Text(
                '${widget.judgments[widget.ListIndex].meritsNo}/${widget.judgments[widget.ListIndex].meritsYear}',
              ),
              const CustomDivider(),
              const Text('Mahkeme',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${widget.judgments[widget.ListIndex].courtName}',
              ),
              const CustomDivider(),
              const Text('Hüküm',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${widget.judgments[widget.ListIndex].decree}',
              ),
              const CustomDivider(),
              const Text('Karar',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${widget.judgments[widget.ListIndex].decision}'),
              const CustomDivider(),
              widget.searchTypeId == 1
                  ? Visibility(
                      visible: !isVisible,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Avukat Değerlendirmesi',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 117, 117, 117),
                                  fontSize: 17)),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          Text(
                              '${widget.judgments[widget.ListIndex].lawyerAssesment}'),
                          const CustomDivider(),
                          const Text('Kararı Ekleyen Kişi',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 117, 117, 117),
                                  fontSize: 17)),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          Text(
                              '${widget.judgments[widget.ListIndex].userName}  ${widget.judgments[widget.ListIndex].lastName} '),
                          const CustomDivider(),
                        ],
                      ))
                  : SizedBox(height: MediaQuery.of(context).size.height / 100),
              const Text('Karar Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${widget.judgments[widget.ListIndex].judgmentDate}'),
              const CustomDivider(),
              const Text('Kayıt Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${widget.judgments[widget.ListIndex].createDate}'),
              const CustomDivider()
            ])),
      ),
    );
  }

  addLike(int id, bool isLiked) async {
    BaseResponseApi response = await judgmentService.addLike(id, isLiked);
    if (response.success == true) {
    } else {
      print(response.message);
    }
  }

  addLawyerJudgmentLike(int id, bool isLiked) async {
    BaseResponseApi response =
        await lawyerJudgmentService.addLawyerJudgmentLike(id, isLiked);
    if (response.success == true) {
    } else {
      print(response.message);
    }
  }
}
