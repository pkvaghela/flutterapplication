import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'basics/EMI_Calculator.dart';

void main(){
  runApp(EMICalculatorContainer ());
}

  //InterestCalculatorContainer example = InterestCalculatorContainer();
  // MyBmiCalculatorContainer example =  MyBmiCalculatorContainer();
  //ConvertCalculatorContainer example =  ConvertCalculatorContainer();
  //runApp(example);

/*void main()
{

  runApp(example);

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Simple app'),),
      body: Center(
        child: Container(
          child: Text('parth vaghela',style: TextStyle(fontSize: 30),),
       //   color: Colors.deepPurple,
          height: 200,
          width: 200,
          alignment: Alignment.center,
        //  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        //  constraints: BoxConstraints(maxHeight: 300,maxWidth: 300),
        //  transform: Matrix4.rotationZ(25.0),
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            border: Border.all(
            //  color:Colors.deepOrange,
              width: 5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(50.0),
           // boxShadow:[ BoxShadow(
             // blurRadius: 50.0,
             //color: Colors.grey,
              //spreadRadius: 20.0,
              //offset: Offset(20.0,15.0),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Colors.yellow,Colors.lightBlue,Colors.pink]
            ),

          ),
        ),
      ),

    ),
  ));
}

*/






/*class MyEasyExample  extends StatelessWidget {
  const MyEasyExample ({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var rtl;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Screen"),

        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(

              padding: EdgeInsets.all(30),
              child: Text('savan'),
        color: Colors.pink,

            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text('parth'),
              color: Colors.teal,
            )

          ],
        )

        ),
      );
  }
}*/


class MyContainerExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
     child: Center(
        child: Container(
          height: 300,
          width: 200,
          color: Colors.amber, alignment: Alignment.center,
          child: Text("parth ",textDirection:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 30.0,color: Colors.red,

          ),
          ),
          //padding: EdgeInsets.only(top: 50)
         //margin: EdgeInsets.only(top: 5),
          //constraints: BoxConstraints(maxWidth: 300,maxHeight: 500),//image usfull property
         // transform: Matrix4.rotationZ(25.0),
          transform: Matrix4.skewX(10.0)..rotateZ(0.0),


        ),
      ),
    );
  }
}


