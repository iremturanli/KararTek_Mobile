import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AramaSonuclariDetayDeneme.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentListInformation.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/widgets/ModalBottomAramaSonuclari.dart';

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
  @override
  void initState() {
    super.initState();

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
        title: const Text('Arama Sonuçları',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: <Widget>[
          widget.judgments.isNotEmpty
              ? IconButton(
                  onPressed: () => showModalBottomSheet<void>(
                      isDismissible: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: const Color.fromARGB(229, 229, 229, 229),
                      // expand: true,

                      context: context,
                      builder: (BuildContext context) =>
                          ModalBottomAramaSonuclari()),
                  icon: const Icon(Icons.filter_alt_outlined))
              : const Text('')
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
              //sizedBox
              height: height / 2,
              width: width,
              child: widget.judgments.isNotEmpty
                  ? ListView.builder(
                      itemCount: widget.judgments.length,
                      itemBuilder: ((context, index) => Card(
                            color: const Color.fromARGB(255, 247, 246, 246),
                            elevation: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 16,
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 28, 63),
                                  child: Text(
                                    widget.judgments[index].id.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                              title: Text(
                                "${widget.judgments[index].commissionName}-${widget.judgments[index].decreeNo}/${widget.judgments[index].decreeYear}",
                              ),
                              subtitle: Text(
                                '${widget.judgments[index].decision}',
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
                                                judgments: widget.judgments,
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