import 'package:flutter/material.dart';

class ChangePasswordPopUp extends StatelessWidget {
  TextEditingController currentPasswordController;
  TextEditingController newPasswordController;
  TextEditingController againPasswordController;
  ChangePasswordPopUp(
      {Key? key,
      required this.currentPasswordController,
      required this.newPasswordController,
      required this.againPasswordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Önceki Şifreniz",
          ),
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
          Text(
            "Yeni Şifreniz",
          ),
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
          Text(
            "Yeni Şifreniz(Tekrar)",
          ),
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
