// ignore_for_file: override_on_non_overriding_member, non_constant_identifier_names, file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ComboBox extends StatelessWidget {
  const ComboBox(
      {Key? key,
      required this.items,
      required this.height_of_box,
      required this.width_of_box,
      required this.color_of_box,
      required this.color_of_text,
      required this.size_of_font,
      this.value,
      this.onChanged})
      : super(key: key);
  @override
  final List<String> items;
  final String? value;
  final Function(String?)? onChanged;
  final double height_of_box;
  final double width_of_box;
  final Color? color_of_box;
  final Color? color_of_text;
  final double size_of_font;

  // final List<String> items = [
  //   'Yüksek Yargı Kararları',
  //   'Avukatın Eklediği Kararlar',
  // ];
  // ignore: non_constant_identifier_names
  //String? selected_Value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            // Icon(
            //   Icons.menu,
            //   size: 20,
            //   color: Color.fromARGB(255, 0, 0, 0),
            // ),

            Text(
              "Seçiniz",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 73, 73, 73),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 73, 73, 73),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: value,
        onChanged: onChanged,
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
        ),
        iconSize: 30,
        iconEnabledColor: const Color.fromARGB(255, 0, 0, 0),
        iconDisabledColor: const Color.fromARGB(255, 0, 0, 0),
        buttonHeight: height_of_box,
        buttonWidth: width_of_box,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: const Color.fromARGB(255, 189, 189, 189), width: 1),
            color: color_of_box),
        // buttonElevation: 1,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 300,
        dropdownWidth: width_of_box,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 252, 252, 252),
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(5),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-2, 0),
      ),
    );
  }
}
