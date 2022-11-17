import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Combobox1 extends StatelessWidget {
  Combobox1({Key? key, required this.items, this.value, this.onChanged})
      : super(key: key);
  @override
  final String? value;
  final List<String> items;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              "Seçiniz",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
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
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
        buttonHeight: 48,
        buttonWidth: 350,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey, width: 1),
            color: const Color.fromARGB(255, 255, 255, 255)),
        // buttonElevation: 1,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 300,
        dropdownWidth: 350,
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
