

import 'package:flutter/material.dart';

class  MYCalculatorAPP extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {

  @override
  _CalculatorState  createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text('$btntxt', style: TextStyle(fontSize: 15, color: txtcolor,
        ),),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0),
                    child: Text('$text', textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white, fontSize: 100,
                      ),),)

                ],
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC', Colors.grey, Colors.black),
                calcbutton('+/-', Colors.grey, Colors.black),
                calcbutton('%', Colors.grey, Colors.black),
                calcbutton('/', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.grey, Colors.white),
                calcbutton('8', Colors.grey, Colors.white),
                calcbutton('9', Colors.grey, Colors.white),
                calcbutton('x', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.grey, Colors.black),
                calcbutton('5', Colors.grey, Colors.black),
                calcbutton('6', Colors.grey, Colors.black),
                calcbutton('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ), Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.grey, Colors.black),
                calcbutton('2', Colors.grey, Colors.black),
                calcbutton('3', Colors.grey, Colors.black),
                calcbutton('+ ', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ), Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {
                    calculation('0');
                  },
                  shape: StadiumBorder(),
                  child: Text(
                    '0', style: TextStyle(fontSize: 35, color: Colors.white),),
                  color: Colors.grey,),
                calcbutton('.', Colors.grey, Colors.white),
                calcbutton('=', Colors.amber, Colors.white),
              ],
            ), SizedBox(
              height: 10,),

          ],

        ),
      ),
    );
  }

  dynamic text = '0';
  double num0ne = 0;
  double numTwo = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preopr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      num0ne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      opr = '';
      preopr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preopr == '+') {
        finalResult = add();
      } else if (preopr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
    } else
    if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' ||
        btnText == '=') {
      if (num0ne == 0) {
        num0ne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preopr = opr;
      opr = btnText;
      result = '';
    }
    else if (btnText == '%') {
      result = num0ne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    }
    else if (btnText == '+/-') {
      result.toString().startsWith('-') ?
      result = result.toString().substring(1) : result =
          '-' + result.toString();
      finalResult = result;
    }
    else {
      result = result + btnText;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (num0ne + numTwo).toString();
    num0ne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (num0ne - numTwo).toString();
    num0ne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (num0ne * numTwo).toString();
    num0ne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (num0ne / numTwo).toString();
    num0ne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}