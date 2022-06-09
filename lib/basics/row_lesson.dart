import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyThirdExample extends StatelessWidget {
  String city = "Bhavnagar,";
  String state = "Gujarat,";
  String country = "India,";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Text(city,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(state,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(country, textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}