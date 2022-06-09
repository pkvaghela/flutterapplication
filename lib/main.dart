import 'package:flutter/material.dart';


import 'mycalculator/MyCalculator_app.dart';
import 'mycalculator/MyEMI_Calculator.dart';

void main() {
  runApp(MyEmiCalculator());
}
class MyDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.purple,
        height: 100,
        width: 100,


      ),
    );
  }
}
class MyDemo2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("parth"),
        ),
      ),
    );
  }
}
