import 'package:flutter/material.dart';

Card makeDashboardItem(String title, IconData icon, VoidCallback onTap) {
  return Card(
      elevation: 0,
      child: Container(
        height: 150,
        width: 165,
        decoration: BoxDecoration(
          color: const Color.fromARGB(229, 229, 229, 229),
          borderRadius: BorderRadius.circular(42),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 133, 133, 133).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
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
                size: 47.5,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Text(title,
                  style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ));
}
