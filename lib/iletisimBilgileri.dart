// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:url_launcher/url_launcher.dart';

_makingPhoneCall() async {
  var url = Uri.parse("tel:+908502518427");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class iletisimBilgileri extends StatelessWidget {
  const iletisimBilgileri({Key? key}) : super(key: key);
//class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'İletişim Bilgileri',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 30,
            left: MediaQuery.of(context).size.height / 80),
        child: Column(children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('Müşteri Hizmetleri (Mesai Saatleri İçinde)',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            // ignore: prefer_const_literals_to_create_immutables

            children: [
              IconButton(
                  onPressed: _makingPhoneCall,
                  icon: Icon(
                    Icons.aod,
                    size: 20,
                  )),
              Text('Telefon: +90 (850) 251 8 427',
                  style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('Faks: +90 (850) 251 8 427', style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          CustomDivider(),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('E-Posta Adreslerimiz (7/24 Online Destek)',
                  style: TextStyle(fontSize: 18.8, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('Bilgi Almak İçin: bilgi@karartek.com.tr',
                  style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('Sorularınız ve Sorunlarınız:',
                  style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('destek@karartek.com.tr', style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          CustomDivider(),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('Adresimiz',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('Barolar Birliği Başkanlığı', style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('Oğuzlar Mahallesi Barış Manço Caddesi',
                  style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('Av. Özdemir Özok Sokak No:8',
                  style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          Row(
            children: const [
              Text('Balgat, 06650, ANKARA', style: TextStyle(fontSize: 16))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          CustomDivider(),
        ]),
      ),
    );
  }
}
