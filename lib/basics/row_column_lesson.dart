import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MyTextExample extends Text{
  late String label;
  MyTextExample(String label):super(label){
    this.label = label;
  }
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(this.label,textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 12,
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
      ),
    );
  }
}

class MyForthExample extends StatelessWidget {
@override
  Widget build(BuildContext context){
  return Material(
    child: Column(
      children: [
        Row(textDirection: TextDirection.ltr,
          children: [
            MyTextExample("first"),
            MyTextExample("second"),
            MyTextExample("third"),
          ],
        ),
       Row(textDirection: TextDirection.ltr,
       children: [
         MyTextExample("four"),
         MyTextExample("five"),
       MyTextExample("six"),
       ],
       ),
        Row(textDirection: TextDirection.ltr,
          children: [
            MyTextExample("sevan"),
            MyTextExample("eight"),
            MyTextExample("nine"),
          ],
          ),

      ],
    )
  );
}

}

