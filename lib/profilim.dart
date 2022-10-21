import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class profilim extends StatefulWidget {
  const profilim({Key? key}) : super(key: key);

  @override
  State<profilim> createState() => _profilimState();
}

class _profilimState extends State<profilim> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(###) ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profilim',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(onPressed: _showToast, icon: Icon(Icons.person))
        ],
      ),
    );
  }

  void _showToast() => Fluttertoast.showToast(
        msg: 'Button Tapped',
      );
}
