import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySipCalculatonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SIP Calculation Demo",
      home: SipCalculaton(),
    );
  }
}

class SipCalculaton extends StatefulWidget {
  @override
  _SipCalculatonState createState() => _SipCalculatonState();
}

class _SipCalculatonState extends State<SipCalculaton> {
  double sip = 0;
  String Result = '';
  double i=0,n=0;
  double MonthlySIPAmount = 0;
  double yearlyRate = 0;
  double years = 0;



  TextEditingController txtMonthlySIPAmount = new TextEditingController();

  @override
  void initState() {
    super.initState();
    txtMonthlySIPAmount.addListener(() {
      if (txtMonthlySIPAmount.text !=null)
        MonthlySIPAmount = double.parse(txtMonthlySIPAmount.text);
      else
        MonthlySIPAmount = 0.0;
    });
  }

  SIPCalculator() {
    setState(() {
      i = yearlyRate / 12 / 100;
      n = years * 12;
      sip = ((MonthlySIPAmount * pow((1 + i), n - 1) / i) * pow((1 + i),0));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("SIP Calculator",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Material(
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: txtMonthlySIPAmount,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  labelText: "Monthly SIP Amount",
                  labelStyle: TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ),
              Slider(

                activeColor: Colors.teal,
                inactiveColor: Colors.teal[200],
                min: 0,
                max: 30,
                onChanged: (SIPinterest) {
                  setState(() {
                    i = SIPinterest;
                  });
                },
                value: i,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.teal),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'SIP Interest',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${double.parse(i.toStringAsFixed(2))}\%',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Slider(
                activeColor: Colors.teal,
                inactiveColor: Colors.teal[200],
                min: 0,
                max: 30,
                onChanged: (SIPYear) {
                  setState(() {
                    n = SIPYear;
                  });
                },
                value: n,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.teal),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text(
                        'SIP Year',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${double.parse(n.toStringAsFixed(2))}\Month',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              FlatButton(
                child: Text('Result',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.teal,
                  ),
                ),
                onPressed: SIPCalculator,
              ),
              Text('the total amount is ${double.parse(sip.toStringAsFixed(2))}',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
