import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/iletisim.dart';
import 'package:flutter_application_1/sSorular.dart';

class iletisimBilgileri extends StatelessWidget {
  const iletisimBilgileri({Key? key}) : super(key: key);
//class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: const Text(
            'İletişim Bilgileri',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 75.0, left: 30.0),
                      child: Text('Müşteri Hizmetleri (Mesai Saatleri İçinde)',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 1.0, right: 120.0),
                        child: Text('Telefon: +90 (850) 251 8 427',
                            style: TextStyle(fontSize: 16)))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 1.0, right: 134.0),
                        child: Text('Faks: +90 (850) 251 8 427',
                            style: TextStyle(fontSize: 16)))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 8.0, left: 15.0, right: 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 1,
                          color: Colors.grey,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 30.0),
                      child: Text('E-Posta Adreslerimiz (7/24 Online Destek)',
                          style: TextStyle(
                              fontSize: 18.8, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 0.0, right: 57.0),
                      child: Text('Bilgi Almak İçin: bilgi@karartek.com.tr',
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 1.0, right: 140.0),
                      child: Text('Sorularınız ve Sorunlarınız:',
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 1.0, right: 155.0),
                      child: Text('destek@karartek.com.tr',
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 8.0, left: 15.0, right: 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 1,
                          color: Colors.grey,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 240.0),
                      child: Text('Adresimiz',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 1.0, right: 155.0),
                      child: Text('Barolar Birliği Başkanlığı',
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 1.0, right: 44.0),
                      child: Text('Oğuzlar Mahallesi Barış Manço Caddesi',
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 1.0, right: 116.0),
                      child: Text('Av. Özdemir Özok Sokak No:8',
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 1.0, right: 158.0),
                      child: Text('Balgat, 06650, ANKARA',
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 8.0, left: 15.0, right: 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 1,
                          color: Colors.grey,
                        ))
                  ],
                )
              ]),
            ],
          )
        ],
      ),
    );
  }
}
