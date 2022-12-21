// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/JudgmentPoolApiResponse.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentListInformation.dart';

import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/services/FavouriteJudgmentService/favouriteJudgmentService.dart';

import '../ApiResponse/JudgmentPoolResponse.dart';
import '../AppConfigurations/appConfigurations.dart';

import 'kararHavuzumDetaylar.dart';
import 'kararList.dart';

class KararHavuzum extends StatefulWidget {
  const KararHavuzum({Key? key}) : super(key: key);

  @override
  State<KararHavuzum> createState() => _KararHavuzumState();
}

class _KararHavuzumState extends State<KararHavuzum>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final FavouriteJudgmentService favouriteJudgmentService =
      getIt.get<FavouriteJudgmentService>();
  List<JudgmentListInformation> judgments = [];
  List<LawyerJudgmentListInformation> lawyerJudgments = [];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Karar Havuzum',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.visible),
          ),
          bottom:
              TabBar(controller: _tabController, indicatorColor: Colors.black,

                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: const <Widget>[
                Tab(
                  icon: Icon(Icons.balance_outlined),
                  text: 'Yüksek Yargı Kararları',
                ),
                Tab(
                  icon: Icon(Icons.supervised_user_circle),
                  text: 'Avukatın Eklediği Kararlar',
                ),
              ]),
          backgroundColor: const Color.fromARGB(255, 61, 93, 136),
          // bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const kararList()));
              }),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: TabBarView(
          controller: _tabController,

          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Column(
              children: [
                Expanded(
                  // height: height,
                  // width: width,
                  child: ListView.builder(
                      itemCount: judgments.length,
                      itemBuilder: ((context, index) => Card(
                            color: const Color.fromARGB(255, 247, 246, 246),
                            elevation: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 16,
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 28, 63),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(color: Colors.white),
                                  )),
                              title: Text(
                                "${judgments[index].commissionName}-${judgments[index].decreeNo}/${judgments[index].decreeYear}",
                              ),
                              subtitle: Text(
                                '${judgments[index].decree}',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KararHavuzumDetay(
                                              judgments: judgments[index],
                                            )));
                              }),
                            ),
                          ))),
                ),
              ],
            ),
            (ListView.builder(
                itemCount: lawyerJudgments.length,
                itemBuilder: ((context, index) => Card(
                      color: const Color.fromARGB(255, 247, 246, 246),
                      elevation: 1,
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 16,
                            backgroundColor:
                                const Color.fromARGB(255, 1, 28, 63),
                            child: Text((index + 1).toString(),
                                style: const TextStyle(color: Colors.white))),
                        title: Text(
                          "${lawyerJudgments[index].commissionName}-${lawyerJudgments[index].decreeNo}/${lawyerJudgments[index].decreeYear}",
                        ),
                        subtitle: Text(
                          '${lawyerJudgments[index].decree}',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KararHavuzumDetay(
                                        lawyerJudgments: lawyerJudgments[index],
                                      )));
                        }),
                      ),
                    )))),
          ],
        ));
  }

  getAll() async {
    try {
      JudgmentPoolResponse response = await favouriteJudgmentService.getAll();
      if (response.success == true) {
        judgments.clear();
        judgments.addAll(response.data!.judgmentResponseListDto!);
        lawyerJudgments.clear();
        lawyerJudgments.addAll(response.data!.lawyerJudgmentResponseListDto!);

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
