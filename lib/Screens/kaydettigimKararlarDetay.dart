import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';

class KaydettigimKararDetay extends StatelessWidget {
  LawyerJudgmentListInformation? savedJudgments;

  // ignore: non_constant_identifier_names

  KaydettigimKararDetay({
    Key? key,
    required this.savedJudgments,
    // ignore: non_constant_identifier_names
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Kaydettiğim Kararlar ',
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
              Text(
                '${savedJudgments!.meritsNo}/${savedJudgments!.meritsNo}',
              ),
              const CustomDivider(),
              const Text('Mahkeme',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${savedJudgments!.courtName}',
              ),
              const CustomDivider(),
              const Text('Hüküm',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${savedJudgments!.decree}',
              ),
              const CustomDivider(),
              const Text('Avukat Açıklaması',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${savedJudgments!.lawyerAssesment}'),
              const CustomDivider(),
              savedJudgments!.tbbComments != ""
                  ? Visibility(
                      visible: isVisible,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('TBB Açıklaması',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 117, 117, 117),
                                  fontSize: 17)),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          Text('${savedJudgments!.tbbComments}'),
                          const CustomDivider()
                        ],
                      ))
                  : const SizedBox(),
              const Text('Karar',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text(
                '${savedJudgments!.decision}',
              ),
              const CustomDivider(),
              const Text('Karar Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${savedJudgments!.judgmentDate}'),
              const CustomDivider(),
              const Text('Kayıt Tarihi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${savedJudgments!.createDate}'),
              const CustomDivider(),
              const Text("TBB'ye Gönderilme Tarihi",
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117), fontSize: 17)),
              SizedBox(height: MediaQuery.of(context).size.height / 100),
              Text('${savedJudgments!.createDate}'),
              const CustomDivider(),
            ])),
      ),
    );
  }
}
