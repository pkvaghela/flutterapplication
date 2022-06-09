import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/Widget/Resuable_Widget.dart';
//import 'package:flutter_project1/basics/row_column_lesson.dart';

class UnitConverterContainer extends StatelessWidget {
  const UnitConverterContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Unit Converter Demo",
      home: UnitConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class UnitConverter extends StatefulWidget {
  const UnitConverter({Key? key}) : super(key: key);

  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  var txtbytes = new TextEditingController();
  int bytes=0;
  bool isKBChecked = false;
  bool isMBChecked = false;
  bool isGBChecked = false;
  late MyCheckBox kb,mb,gb;
  var finalResult = "output will be displayed here...";

  _UnitConverterState()
  {
    print("_UnitConverterState called");
    kb = new MyCheckBox("kb", isKBChecked);
    mb = new MyCheckBox("mb", isMBChecked);
    gb = new MyCheckBox("gb", isGBChecked);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    txtbytes.addListener(() {
      if(txtbytes!=null && txtbytes.text.toString().length>0)
      {
        bytes = int.parse(txtbytes.text.toString());
      }
      else
      {
        bytes = 0;
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            MyTextFormField('Enter bytes',txtbytes),
            Row(
              children: [
                kb,mb,gb
              ],
            ),
            ElevatedButton(
              onPressed: ()
              {
                print("Button Clicked...");
                Convert();
              },
              child: Text(
                  "Convert"
              ),),
            Text(finalResult,textDirection: TextDirection.ltr,)
          ],
        ),
      ),
    );
  }

  void Convert() {
    var result=0.0; //double
    var msg = ""; //string
    print("Convert function called");
    if(kb.state.isItChecked()==true) {
      print("kb checked");
      result = bytes / 1024;
      msg = "kb = $result";
    }
    if(mb.state.isItChecked()==true){
      print("mb checked");
      result = bytes / (1024 * 1024);
      msg += " mb = $result";
    }
    if(gb.state.isItChecked()==true) {
      print("gb checked");
      result = bytes / (1024 * 1024 * 1024);
      msg += " gb = $result";
    }
    print(msg);
    setState(() {
      finalResult = msg;
    });
  }
}

