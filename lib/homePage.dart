import 'package:flutter/material.dart';
import 'package:flutter_application_1/AramaSonuclari.dart';
import 'package:flutter_application_1/iletisim.dart';
import 'package:flutter_application_1/kararArama.dart';
import 'package:flutter_application_1/kararAramaTest.dart';
import 'package:flutter_application_1/kararIslemleri.dart';
import 'package:flutter_application_1/popUp.dart';
import 'package:flutter_application_1/profilim.dart';

import 'Card.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.0,
              width: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/hakim.jpg"), fit: BoxFit.cover),
              ),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15),
                  // ignore: prefer_const_constructors
                  child: Image(
                    image: const AssetImage("assets/login-logo.png"),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makeDashboardItem("Karar Arama", Icons.search, (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KararArama()));
                })),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 12,
                ),
                makeDashboardItem("Karar İşlemleri", Icons.settings, (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => kararIslemleri()));
                })),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makeDashboardItem("İletişim Bilgileri", Icons.phone, (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => iletisim()));
                })),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 12,
                ),
                makeDashboardItem("Profilim", Icons.person, (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profilim()));
                })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
