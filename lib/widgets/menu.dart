import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/CustomDivider.dart';

class Menu extends StatelessWidget {
  final VoidCallback press;
  final String labelText;
  final IconData iconTrailing, iconLeading;
  Menu(
      {required this.press,
      Key? key,
      required this.labelText,
      required this.iconTrailing,
      required this.iconLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(labelText, style: const TextStyle(fontSize: 18)),
          trailing: Icon(
            iconTrailing,
            color: Colors.black,
            size: 25,
          ),
          leading: Icon(
            iconLeading,
            color: Colors.black,
            size: 25,
          ),
          onTap: press,
        ),
        const CustomDivider()
      ],
    );
  }
}
