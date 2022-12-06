import 'package:flutter/material.dart';

class ChangePasswordPopUp extends StatelessWidget {
  ChangePasswordPopUp({Key? key}) : super(key: key);
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController againPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("Önceki Şifreniz", textAlign: TextAlign.left),
      TextFormField(
          controller: currentPasswordController,
          minLines: 1,
          maxLines: 1,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Şifrenizi Giriniz',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: const Color.fromARGB(255, 189, 189, 189),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          )),
      Text("Yeni Şifreniz", textAlign: TextAlign.left),
      TextFormField(
          controller: newPasswordController,
          minLines: 1,
          maxLines: 1,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Yeni Şifrenizi Giriniz',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: const Color.fromARGB(255, 189, 189, 189),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          )),
      Text("Yeni Şifreniz(Tekrar)", textAlign: TextAlign.left),
      TextFormField(
          controller: againPasswordController,
          minLines: 1,
          maxLines: 1,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Yeni Şifrenizi Giriniz',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: const Color.fromARGB(255, 189, 189, 189),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          )),
    ]);
  }
}
