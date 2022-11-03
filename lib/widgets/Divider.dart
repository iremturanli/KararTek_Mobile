import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
        height: 6,
        thickness: 0.3,
        indent: 10,
        endIndent: 10,
        color: Colors.grey);
  }
}
