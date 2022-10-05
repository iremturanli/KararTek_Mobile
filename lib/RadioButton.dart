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
      children: [
        Expanded(
          flex: 1,
          child: RadioListTile(
            activeColor: const Color.fromARGB(255, 1, 28, 63),
            title: Transform.translate(
                offset: const Offset(-16, 0),
                child: const Text(style: TextStyle(fontSize: 10), 'Yargıtay')),
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
                offset: const Offset(-16, 0),
                child: const Text(style: TextStyle(fontSize: 10), 'Danıştay')),
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
            activeColor: const Color.fromARGB(255, 1, 28, 63),
            title: Transform.translate(
                offset: const Offset(-16, 0),
                child: const Text(
                    style: TextStyle(fontSize: 10), 'Anayasa Mahkemesi')),
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