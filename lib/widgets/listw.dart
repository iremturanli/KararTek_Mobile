import 'package:flutter/material.dart';

import '../kararArama.dart';

class ListCustom extends StatefulWidget {
  final List<Map<String, dynamic>> _kararhavuzum;
  final String parameters;
  ListCustom(this._kararhavuzum, {Key? key, required this.parameters})
      : super(key: key);

  @override
  State<ListCustom> createState() => _ListCustomState();
}

class _ListCustomState extends State<ListCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(

        // margin: const EdgeInsets.symmetric(vertical: 7),

        );
  }
}
