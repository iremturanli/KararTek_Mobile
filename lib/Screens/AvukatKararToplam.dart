// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/UserStatisticApiResponse.dart';
import 'package:flutter_application_1/models/UserStatisticInformation/FilterUserStatisticDto.dart';

import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/ModalBottomOnay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../ApiResponse/UserStatisticFilterApiResponse.dart';
import '../AppConfigurations/appConfigurations.dart';
import '../main.dart';
import '../models/UserStatisticInformation/userStatisticInformation.dart';
import '../services/LawyerJudgmentServices/LawyerJudgmentService.dart';

// final List<Map<String, dynamic>> _avukatKararToplam = [
//   {
//     "id": 1,
//     "Ad": "İrem",
//     "Soyad": "Turanlı",
//     "Şehir": "Ankara",
//     "Eklenen Karar Toplamı": "2",
//   },
//   {
//     "id": 2,
//     "Ad": "Berkay",
//     "Soyad": "Demir",
//     "Şehir": "Ankara",
//     "Eklenen Karar Toplamı": "5",
//   },
//   {
//     "id": 3,
//     "Ad": "Işıl",
//     "Soyad": " Bardakcı",
//     "Şehir": "Ankara",
//     "Eklenen Karar Toplamı": "8",
//   },
//   {
//     "id": 4,
//     "Ad": "Hussain",
//     "Soyad": "Elburki",
//     "Şehir": "Ankara",
//     "Eklenen Karar Toplamı": "3",
//   },
// ];
// final List<String> _sehir = ["Adana", "...", "Düzce"]; //?

class AvukatKararToplam extends StatefulWidget {
  const AvukatKararToplam({Key? key}) : super(key: key);

  @override
  State<AvukatKararToplam> createState() => _AvukatKararToplamState();
}

class _AvukatKararToplamState extends State<AvukatKararToplam> {
  @override
  void initState() {
    super.initState();
    getJudgmentsCountbyKeyword("");
    searchController.addListener((searchinList));
  }

  TextEditingController searchController = TextEditingController();

  FilterUserStatisticDto filterUserStatisticDto = FilterUserStatisticDto();

  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();
  List<UserStatisticInformation> userStatistics = [];
  List<FilterUserStatisticDto> filterUserStatistic = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Avukat Karar Toplam',
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.height / 2.5,
            child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    contentPadding: EdgeInsets.all(
                        MediaQuery.of(context).size.height / 100),
                    hintText: "Ara",
                    filled: true,
                    fillColor: const Color.fromARGB(255, 252, 252, 252),
                    focusedBorder: OutlineInputBorder(
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    suffixIcon: const Icon(Icons.search),
                    suffixIconColor: Colors.grey),
                onChanged: (newValue) {
                  newValue = searchController.text;

                  getJudgmentsCountbyKeyword(searchController.text);
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text("Sıra"),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              const Text("Ad Soyad"),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              const Text("Şehir"),
              const Text("Eklenen Karar Toplamı"),
            ],
          ),
          const CustomDivider(),
          Container(
            height: height,
            width: width,
            child: ListView.builder(
                itemCount: filterUserStatistic.length,
                itemBuilder: ((context, index) => Card(
                      color: const Color.fromARGB(229, 229, 229, 229),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: height / 50),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 28, 63),
                              radius: 15,
                              child: Text('${index + 1}',
                                  style: const TextStyle(fontSize: 14)),
                            ),
                          ),
                          Text(
                              '${filterUserStatistic[index].userName} ${filterUserStatistic[index].lastName}'),
                          Text('${filterUserStatistic[index].cityName}'),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 20),
                          Padding(
                            padding: EdgeInsets.only(right: height / 8),
                            child: Text(
                                '${filterUserStatistic[index].judgmentCount}'),
                          )
                        ],
                      ),
                    ))),
          ),
        ],
      )),
    );
  }

  getJudgmentsCount() async {
    try {
      UserStatisticApiResponse response =
          await lawyerJudgmentService.getJudgmentsCount();
      if (response.success == true) {
        userStatistics.clear();
        userStatistics.addAll(response.data!);
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

  getJudgmentsCountbyKeyword(String? keyword) async {
    try {
      UserStatisticFilterApiResponse response =
          await lawyerJudgmentService.getJudgmentCountbyKeyword(keyword!);
      if (response.success == true) {
        filterUserStatistic.clear();
        filterUserStatistic.addAll(response.data!);
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

  searchinList() {
    print("Second text field: ${searchController.text}");
  }
}
