import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
//import 'package:vibration/vibration.dart';

class MyDropdownContainer  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "dropdown button demo",
      home: MyDropdown()
    );
  }
}
class MyDropdown extends StatefulWidget {


  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  List<String> MyItemList =["1","2","3","4","5"];
  String SelectedItem = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("dropdown demo"),
      ),
      body: Material(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Select duration",textDirection: TextDirection.ltr,),
              DropdownButton(
                items: getItemListAsWidget(),
                onChanged: (value){
                  if(value!=null){
                    setState(() {
                      SelectedItem = value.toString();
                    });
                  }
                },
                value: SelectedItem,),
          ElevatedButton(
              onPressed:() {
                print(SelectedItem);
                int seconds = int.parse(SelectedItem) * 1000;
                Vibration.vibrate(duration: seconds);
              },
            child: Text("vibrate phone"),
              )
            ],
          ),
        ),
      ),
    );
  }
  List<DropdownMenuItem<String>> getItemListAsWidget(){
    List<DropdownMenuItem<String>> Items = [];
    for(String CurrentItem in MyItemList) {
      var myitem = DropdownMenuItem(
        child: Text(CurrentItem), value: CurrentItem,);
      Items.add(myitem);
    }
    return Items;
    }
  }



