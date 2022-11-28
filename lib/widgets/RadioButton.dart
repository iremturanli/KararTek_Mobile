// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiResponse/JudgmentTypeRadioButtonResponse.dart';
import 'package:flutter_application_1/models/EDecisionTypes.dart';
import 'package:flutter_application_1/models/JudgmentTypeInformation/judgmentTypeInformation.dart';
import 'package:flutter_application_1/services/DropDownServices/JudgmentTypeRadioButtonService.dart';

import '../AppConfigurations/appConfigurations.dart';

class RadioButton extends StatefulWidget {
  int? decisionValue;
  RadioButton({Key? key, this.decisionValue}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

enum YuksekYargi { yargitay, danistay, anayasaMahkemesi }

YuksekYargi? _yuksekYargi = YuksekYargi.yargitay;

class _RadioButtonState extends State<RadioButton> {
  final JudgmentTypeRadioButtonService judgmentTypeRadioButtonService =
      getIt.get<JudgmentTypeRadioButtonService>();
  List<JudgmentTypeInformation> judgmentTypeInformation = [];
  int? decisionValue;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: RadioListTile(
              activeColor: const Color.fromARGB(255, 1, 28, 63),
              title: Transform.translate(
                  offset: const Offset(-20, 0),
                  child:
                      const Text(style: TextStyle(fontSize: 11), 'Yargıtay')),
              value: YuksekYargi.yargitay,
              groupValue: _yuksekYargi,
              onChanged: (YuksekYargi? value) {
                setState(() {
                  _yuksekYargi = value;
                  decisionValue = EDecisionTypes.Yargitay;
                });
              }),
        ),
        Expanded(
          flex: 1,
          child: RadioListTile(
            activeColor: const Color.fromARGB(255, 1, 28, 63),
            title: Transform.translate(
                offset: const Offset(-20, 0),
                child: const Text(style: TextStyle(fontSize: 11), 'Danıştay')),
            value: YuksekYargi.danistay,
            groupValue: _yuksekYargi,
            onChanged: ((YuksekYargi? value) {
              setState(() {
                _yuksekYargi = value;
                decisionValue = EDecisionTypes.Danistay;
                print(decisionValue);
              });
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: RadioListTile(
            enableFeedback: true, //
            activeColor: const Color.fromARGB(255, 1, 28, 63),
            title: Transform.translate(
                offset: const Offset(-20, 0),
                child: const Text(
                  maxLines: 2,
                  style: TextStyle(fontSize: 10.2),
                  'Anayasa Mahkemesi',
                  // overflow: TextOverflow.fade,
                )),
            value: YuksekYargi.anayasaMahkemesi,
            groupValue: _yuksekYargi,
            onChanged: ((YuksekYargi? value) {
              setState(() {
                _yuksekYargi = value;
                widget.decisionValue = EDecisionTypes.AnayasaMahkemesi;
                print(decisionValue);
              });
            }),
          ),
        ),
      ],
    );
  }

  // getJudgmentTypes() async {
  //   JudgmentTypeInformationResponse response =
  //       await judgmentTypeRadioButtonService.getJudgmentTypes();
  //   if (response.hasError == false) {
  //     judgmentTypeInformation.addAll(response.judgmentTypeInformation);

  //     print(response.judgmentTypeInformation.length);
  //     setState(() {
  //       print("hello");
  //     });
  //   } else {
  //     print(response.errorMessage);
  //   }
  // }
}
