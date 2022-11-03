import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String yuksek_Yargi = "Yargıtay";
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
                child: const Text(style: TextStyle(fontSize: 11), 'Yargıtay')),
            value: 'yargitay',
            groupValue: yuksek_Yargi,
            onChanged: ((value) {
              setState(() {
                yuksek_Yargi = value.toString();
              });
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: RadioListTile(
            activeColor: const Color.fromARGB(255, 1, 28, 63),
            title: Transform.translate(
                offset: const Offset(-20, 0),
                child: const Text(style: TextStyle(fontSize: 11), 'Danıştay')),
            value: 'danistay',
            groupValue: yuksek_Yargi,
            onChanged: ((value) {
              setState(() {
                yuksek_Yargi = value.toString();
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
                  'Anayasa Mahkeme',
                  // overflow: TextOverflow.fade,
                )),
            value: 'anayasaMahkemesi',
            groupValue: yuksek_Yargi,
            onChanged: ((value) {
              setState(() {
                yuksek_Yargi = value.toString();
              });
            }),
          ),
        ),
      ],
    );
  }
}


          
              
 
  // Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               RadioListTile(
  //                 title: Text('Yargıtay'),
  //                 value: 'yargitay',
  //                 groupValue: yuksek_Yargi,
  //                 onChanged: ((value) {
  //                   setState(() {
  //                     yuksek_Yargi = value.toString();
  //                   });
  //                 }),
  // //               ),
  // //               RadioListTile(
  // //                   title: Text('Danıştay'),
  // //                   value: 'danistay',
  // //                   groupValue: yuksek_Yargi,
  // //                   onChanged: ((value) {
  // //                     setState(() {
  // //                       yuksek_Yargi = value.toString();
  // //                     });
  // //                   })),
  // //               RadioListTile(
  // //                   title: const Text('Anayasa'),
  // //                   value: 'anayasa_mahkemesi',
  // //                   groupValue: yuksek_Yargi,
  // //                   onChanged: ((value) {
  // //                     setState(() {
  // //                       yuksek_Yargi = value.toString();
  // //                     });
  // //                   })),
  // //             ],
  // //           ),