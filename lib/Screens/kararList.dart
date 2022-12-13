import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AvukatKararToplam.dart';
import 'package:flutter_application_1/Screens/KararHavuzum.dart';
import 'package:flutter_application_1/Screens/KaydettigimKararlar.dart';
import 'package:flutter_application_1/Screens/OnayBekleyenKararlar.dart';
import 'package:flutter_application_1/Screens/iletisimBilgileri.dart';
import 'package:flutter_application_1/Screens/kararKayit.dart';
import 'package:flutter_application_1/Screens/s_Sorular.dart';

import '../ApiResponse/UserInformationResponse.dart';
import '../AppConfigurations/appConfigurations.dart';
import '../models/UserInformation/UserListInformation.dart';
import '../services/UserService/UserService.dart';
import '../widgets/menu.dart';

final List<Map<String, dynamic>> _kararIslemleri = [
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.add_comment_sharp,
    "content": "Yeni Karar Kaydı"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.edit,
    "content": "Karar Havuzum"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.saved_search,
    "content": "Kaydettiğim Kararlar"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.approval_outlined,
    "content": "Onay Bekleyen Kararlar"
  },
  {
    "trailing": Icons.keyboard_arrow_right_sharp,
    "leading": Icons.analytics_outlined,
    "content": "Avukat Karar Toplamları"
  }
];

final UserService userService = getIt.get<UserService>();
bool? control = false;
List<UserListInformation> usersInformations = [];

class kararList extends StatefulWidget {
  const kararList({Key? key}) : super(key: key);

  @override
  State<kararList> createState() => _kararListState();
}

class _kararListState extends State<kararList> {
  @override
  void initState() {
    getUserById();

    super.initState();
    if (usersInformations.isEmpty) {
      getUserById();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Karar İşlemleri',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
          child: ListView.builder(
              itemCount: usersInformations.isEmpty
                  ? 0
                  : usersInformations[0].userTypeId == 3
                      ? 5
                      : 3,
              itemBuilder: ((context, index) => Menu(
                  press: (() {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => kararKayit(),
                          ),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KararHavuzum(),
                          ),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KaydettigimKararlar(),
                          ),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnayBekleyenKararlar(),
                          ),
                        );
                        break;
                      case 4:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvukatKararToplam(),
                          ),
                        );
                        break;
                    }
                  }),
                  labelText: _kararIslemleri[index]["content"],
                  iconTrailing: _kararIslemleri[index]["trailing"],
                  iconLeading: _kararIslemleri[index]["leading"]))),
        ));
  }

  getUserById() async {
    UserInformationResponse response = await userService.getUserById();
    if (response.success == true) {
      usersInformations.clear();
      usersInformations.addAll(response.data!);

      print(response.success);
      setState(() {});

      print(response);
    } else {
      print(response.message);
    }
  }
}
