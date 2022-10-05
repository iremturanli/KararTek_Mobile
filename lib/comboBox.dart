import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ComboBox extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  ComboBox({
    Key? key,
    this.selectedValue,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            // Icon(
            //   Icons.menu,
            //   size: 20,
            //   color: Color.fromARGB(255, 0, 0, 0),
            // ),
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
        value: selectedValue,
        onChanged: (value) {
          // setState(() {
          //   selectedValue = value as String;
          // });
        },
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
        ),
        iconSize: 30,
        iconEnabledColor: Color.fromARGB(255, 0, 0, 0),
        iconDisabledColor: Color.fromARGB(255, 0, 0, 0),
        buttonHeight: 48,
        buttonWidth: 350,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 1),
            color: Color.fromARGB(255, 255, 255, 255)),
        // buttonElevation: 1,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 300,
        dropdownWidth: 350,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 252, 252, 252),
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
