import 'package:flutter/material.dart';

class OnayPopUp extends StatelessWidget {
  const OnayPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
          minLines: 8,
          maxLines: null,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Açıklama Giriniz',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: const Color.fromARGB(255, 189, 189, 189),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          )),
    );
  }
}
