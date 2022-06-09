import 'dart:math';

import 'package:flutter/material.dart';

class MyEmiCalculator extends StatelessWidget {
  const MyEmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EMICalculator(),
    );
  }
}

class EMICalculator extends StatefulWidget {
  @override
  _EMICalculatorState createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  double p = 0, r = 0, n = 0, emi = 0;
  EMICalculator() {
    setState(() {
      r = r / 12;
      r = r / 100;
      emi = (p * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff023047),
        title: Text("EMI Calculator"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/register.png',
                  ),
                  fit: BoxFit.cover)),
          margin: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Slider(
                activeColor: Color(0xff216869),
                inactiveColor: Colors.teal[200],
                min: 0,
                max: 1000000,
                onChanged: (amount) {
                  setState(() {
                    p = amount;
                  });
                },
                value: p.toInt().toDouble(),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(color:Color(0xffffcb69)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Loan Amount',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${double.parse(p.toStringAsFixed(2))}\Rs',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Slider(
                activeColor: Color(0xff216869),
                inactiveColor: Colors.teal[200],
                min: 0,
                max: 35,
                onChanged: (rate) {
                  setState(() {
                    r = rate;
                  });
                },
                value: r,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffffcb69),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Intrest Rate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${double.parse(r.toStringAsFixed(2))}\%',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
              Slider(
                activeColor: Color(0xff216869),
                inactiveColor: Colors.teal[200],
                min: 0,
                max: 24,
                onChanged: (Tenor) {
                  setState(() {
                    n = Tenor;
                  });
                },
                value: n,
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xffffcb69)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tenor',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '${double.parse(n.toStringAsFixed(2))}\Months',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                child: Text(
                  'Result',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30.0,
                  ),
                ),
                onPressed: EMICalculator,
              ),
              Text(
                'the total amount is ${double.parse(emi.toStringAsFixed(2))}',
                style: TextStyle(fontSize: 30.0, color: Colors.teal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
