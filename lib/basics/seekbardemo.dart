import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RGBColorContainer extends StatelessWidget {
  const RGBColorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RGB Color Generator",
      home: RGBColor(),
    );
  }
}
class RGBColor extends StatefulWidget {
  @override
_RGBColorState createState() => _RGBColorState();
}

class _RGBColorState extends State<RGBColor> {
  double red =0 ,green=0,blue=0;
  Color SelectColor = new Color.fromRGBO(255, 255, 255,1.0);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: SelectColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              activeColor: Colors.red,
              thumbColor: Colors.black,
              value: red,
              min: 0,
              max: 255,
              label: red.round().toString(),
              onChanged: (value){
                setState(() {
                  red = value;
                });
                GenerateRGBColor();
              },),
            Slider(
              activeColor: Colors.green,
              thumbColor: Colors.blueGrey,
              value: green,
              min: 0,
              
              max: 255,
              label: green.round().toString(),
              onChanged: (value){
                setState(() {
                  green = value;
                });
                GenerateRGBColor();
              },),
            Slider(
              activeColor: Colors.blue,
              thumbColor: Colors.black45,
              value: blue,
              min: 0,
              max: 255,
              label: blue.round().toString(),
              onChanged: (value){
                setState(() {
                  blue =value;
                });
                GenerateRGBColor();
              },),
          ],
        ),
      )
    );
  }

  void GenerateRGBColor() {
    setState(() {
      SelectColor = new Color.fromRGBO(red.round(), green.round(), blue.round(), 1.0);
    });
  }
}


