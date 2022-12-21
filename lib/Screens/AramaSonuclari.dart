// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AramaSonuclariDetayDeneme.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/widgets/ModalBottomAramaSonuclari.dart';

import '../ApiResponse/CommissionDropdownResponse.dart';
import '../ApiResponse/CourtDropdownResponse.dart';
import '../AppConfigurations/appConfigurations.dart';
import '../models/CommissionInformation/commissionInformation.dart';
import '../models/CourtInformation/CourtInformation.dart';
import '../models/ForLikeInformation/forLikeList.dart';
import '../models/SearchTypeInformation/searchTypeInformation.dart';
import '../services/DropDownServices/CommissionDropdownService.dart';
import '../services/DropDownServices/CourtDropdownService.dart';
import '../services/JudgmentServices/judgmentService.dart';
import '../services/LawyerJudgmentServices/LawyerJudgmentService.dart';
import '../services/UserLikeServices/UserLikeService.dart';

final List<String> _siralama = [
  'Karar Tarihine Göre',
  'Beğeni Sayısına Göre',
];

// ignore: must_be_immutable
class AramaSonuclari extends StatefulWidget {
  // List<JudgmentListInformation> judgments = [];
  List<LawyerJudgmentListInformation> judgments = [];
  final int? searchTypeId;
  AramaSonuclari(
      {Key? key, required this.judgments, required this.searchTypeId})
      : super(key: key);

  @override
  State<AramaSonuclari> createState() => _AramaSonuclariState();
}

class _AramaSonuclariState extends State<AramaSonuclari> {
  final bool _isTap = false;

  String? dropdownValue;

  final JudgmentService judgmentService = getIt.get<JudgmentService>();
  final LawyerJudgmentService lawyerJudgmentService =
      getIt.get<LawyerJudgmentService>();
  final CommissionDropdownService commissionDropdownService =
      getIt.get<CommissionDropdownService>();
  final CourtDropdownService courtDropdownService =
      getIt.get<CourtDropdownService>();
  int? lookCourt;
  CommissionInformation? selectedCommission;
  List<CommissionInformation> commissionInformation = [];
  CourtInformation? selectedCourt;
  DateTime? selectedFirstDate;
  DateTime? selectedLastDate;
  List<CourtInformation> courtInformation = [];
  int? selectedItem = 0;

  final UserLikeService userLikeService = getIt.get<UserLikeService>();

  List<LawyerJudgmentListInformation> judgmentsNewList = [];
  List<ForLikeList> userLikes = [];
  SearchTypeInformation? selectedOption;
  int? decisionValue;

  @override
  void initState() {
    getAllCourts();
    getCommissions();
    super.initState();
    judgmentsNewList = widget.judgments;
    //print(widget._bulunanKararlar);
  }

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
        centerTitle: true,
        title: const Text('Arama Sonuçları',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: <Widget>[
          judgmentsNewList.isNotEmpty
              ? IconButton(
                  onPressed: () => showModalBottomSheet<void>(
                      isScrollControlled: true,
                      useRootNavigator: false,
                      // backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            ((BuildContext context, StateSetter setState) {
                          return SingleChildScrollView(
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          40,
                                      right: MediaQuery.of(context).size.width /
                                          25,
                                      left: MediaQuery.of(context).size.width /
                                          25,
                                    ),
                                    child: Form(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Center(
                                            child: Text(
                                              'Filtrele',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const Text(
                                            'Kelime',
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80,
                                          ),
                                          TextFormField(
                                            // ignore: prefer_const_constructors
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // ignore: prefer_const_constructors
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      255, 189, 189, 189),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  80),
                                          const Text('Daire/Kurul Adı*'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80,
                                          ),
                                          Container(
                                            height: 45,
                                            width: 330,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white),
                                            child: DropdownButtonFormField<
                                                CommissionInformation>(
                                              isExpanded: true,
                                              //underline: SizedBox.shrink(),
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              dropdownColor: Colors.white,
                                              value: selectedCommission,
                                              onChanged: (CommissionInformation?
                                                  newValue) {
                                                setState(() {
                                                  selectedCommission = newValue;
                                                  lookCourt =
                                                      selectedCommission!
                                                          .CommissionID;
                                                  print("Daire");
                                                  print(selectedCommission!
                                                      .CommissionID
                                                      .toString());
                                                  // selectedCourt = null;
                                                  // getCourts(lookCourt);

                                                  //selectedCourt = null;
                                                });

                                                //selectedCommission = null;
                                              },

                                              // validator: (value) => value ==
                                              //         null
                                              //     ? "Bu alan boş bırakılamaz"
                                              //     : null,
                                              items: commissionInformation.map(
                                                  (CommissionInformation
                                                      commissionInformation) {
                                                return DropdownMenuItem<
                                                    CommissionInformation>(
                                                  value: commissionInformation,
                                                  child: Text(
                                                    commissionInformation
                                                        .CommissionName!,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80,
                                          ),
                                          const Text(
                                            'Mahkeme',
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80,
                                          ),
                                          Container(
                                            height: 45,
                                            width: 330,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white),
                                            child: DropdownButtonFormField<
                                                CourtInformation>(
                                              isExpanded: true,
                                              //underline: SizedBox.shrink(),
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              dropdownColor: Colors.white,
                                              value: selectedCourt,
                                              onChanged:
                                                  (CourtInformation? newValue) {
                                                setState(() {
                                                  selectedCourt = newValue;
                                                  print(selectedCourt!.CourtID
                                                      .toString());
                                                });
                                              },

                                              items: courtInformation.map(
                                                  (CourtInformation
                                                      courtInformation) {
                                                return DropdownMenuItem<
                                                    CourtInformation>(
                                                  value: courtInformation,
                                                  child: Text(
                                                    courtInformation.CourtName!,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80,
                                          ),
                                          const Text(
                                            'Sıralama',
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80,
                                          ),
                                          Container(
                                            height: 45,
                                            width: 330,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white),
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              underline: Container(
                                                height: 1,
                                                color: Colors.grey,
                                              ),
                                              onChanged: (String? value) {
                                                // This is called when the user selects an item.
                                                setState(() {
                                                  dropdownValue = value!;
                                                });
                                              },
                                              items: _siralama.map<
                                                      DropdownMenuItem<String>>(
                                                  (String? value) {
                                                if (value ==
                                                    'Karar Tarihine Göre') {
                                                  selectedItem = 1;
                                                } else if (value ==
                                                    'Beğeni Sayısına Göre') {
                                                  selectedItem = 2;
                                                }
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value!),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  85),
                                          Center(
                                            child: ElevatedButton.icon(
                                                onPressed: () {
                                                  judgmentsNewList =
                                                      widget.judgments;
                                                  Navigator.of(context).pop();
                                                },
                                                icon: const Icon(Icons.search),
                                                label: const Text(
                                                  "Sorgula",
                                                  style:
                                                      TextStyle(fontSize: 17.5),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    minimumSize:
                                                        const Size(100, 40),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 1, 28, 63))),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                70,
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          );
                        }));
                      }),
                  icon: Icon(Icons.filter_alt_outlined))
              : const Text('')
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
              //sizedBox
              height: height,
              width: width,
              child: judgmentsNewList.isNotEmpty
                  ? ListView.builder(
                      itemCount: judgmentsNewList.length,
                      itemBuilder: ((context, index) => Card(
                            color: const Color.fromARGB(255, 247, 246, 246),
                            elevation: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 28, 63),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                              title: Text(
                                "${judgmentsNewList[index].commissionName}-${judgmentsNewList[index].decreeNo}/${judgmentsNewList[index].decreeYear}",
                              ),
                              subtitle: Text(
                                '${judgmentsNewList[index].decision}',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AramaSonuclariDetayDeneme(
                                                searchTypeId:
                                                    widget.searchTypeId,
                                                judgments: judgmentsNewList,
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

  getCommissions() async {
    CommissionInformationResponse response =
        await commissionDropdownService.getCommissions();
    if (response.hasError == false) {
      commissionInformation.clear();
      commissionInformation.addAll(response.commissionInformation);

      print(response.commissionInformation.length);
      setState(() {});
    } else {
      print(response.errorMessage);
    }
  }

  getAllCourts() async {
    CourtInformationResponse response =
        await courtDropdownService.getAllCourts();
    if (response.success == true) {
      courtInformation.clear();
      courtInformation.addAll(response.courtInformation);

      setState(() {
        print(response.courtInformation.length);
      });
    } else {
      print(response.message);
    }
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