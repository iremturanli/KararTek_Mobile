import 'package:flutter/material.dart';
import 'package:flutter_application_1/AramaSonuclari.dart';
import 'package:flutter_application_1/widgets/ModalBottom.dart';
import 'package:flutter_application_1/widgets/RadioButton.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'widgets/comboBoxLarge.dart';
import 'widgets/comboBox.dart';

class KararArama extends StatefulWidget {
  const KararArama({Key? key}) : super(key: key);

  @override
  _KararAramaState createState() => _KararAramaState();

  _runFilter(TextEditingController textEditingController) {}
}

class _KararAramaState extends State<KararArama> {
  final textEditingController = TextEditingController();
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];
  String? selectedValue;

  final List<String> kararlar = [
    'Yüksek Yargı Kararları',
    'Avukatın Eklediği Kararlar',
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  // @override
  // initState() {
  //   // at the beginning, all users are shown
  //   _foundUsers = _allUsers;
  //   super.initState();
  // }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isNotEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // results = _allUsers;
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    //Refresh the UI
    setState(() {
      _foundUsers = results;

      if (_foundUsers.isEmpty) {
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AramaSonuclari(_foundUsers)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 80),
              // ignore: prefer_const_constructors
              child: Image(
                image: const AssetImage("assets/login-logo.png"),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 55,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Ara',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 252, 252, 252),
                  focusedBorder: OutlineInputBorder(
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                controller: textEditingController,
              ),
            ),
            const SizedBox(height: 30),
            ComboBox(
              items: kararlar,
            ),
            const RadioButton(),
            const SizedBox(height: 70),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      minimumSize: const Size(350, 55),
                      backgroundColor: const Color.fromARGB(255, 1, 28, 63)),
                  onPressed: () {
                    _runFilter(textEditingController.text);
                  },
                  child: const Text(
                    'Arama Yap',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      minimumSize: const Size(350, 55),
                      backgroundColor:
                          const Color.fromARGB(255, 126, 126, 126)),
                  onPressed: () => showMaterialModalBottomSheet<void>(
                    expand: true,
                    // backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) => ModalBottom(
                      press: () {
                        _runFilter(textEditingController.text);
                      },
                      searchWord: textEditingController,
                    ),
                  ),
                  child: const Text(
                    'Detaylı Arama',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                // Visibility(
                //   visible: true,
                //   child: child)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
