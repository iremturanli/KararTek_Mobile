import 'package:flutter/material.dart';

Card makeDashboardItem(String title, IconData icon, VoidCallback onTap) {
  return Card(
      elevation: 0.0,
      child: Container(
        height: 150,
        width: 170,
        decoration: BoxDecoration(
          color: const Color.fromARGB(229, 229, 229, 229),
          borderRadius: BorderRadius.circular(42),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 122, 121, 121).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50.0,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Text(title,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ));
}
