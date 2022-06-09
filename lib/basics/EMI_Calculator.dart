
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EMICalculatorContainer extends StatelessWidget {
  const EMICalculatorContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "EMI Calculator Demo",
      debugShowCheckedModeBanner:false,
      home: EMICalculator(),
    );
  }
}
class EMICalculator extends StatefulWidget {
  @override
  _EMICalculatorState createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {

double p = 0,r= 0,n=0,emi = 0;
EMICalculation(){
  setState(() {
    r=r/12;
    r=r/100;
    emi = (p*r*pow((1+r),n)/(pow((1+r),n)-1));
  });

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("EMI Calculator"),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[

              Slider(
                activeColor: Colors.teal,
                inactiveColor: Colors.teal[200],
                min: 0,
                max: 2500000,
                onChanged: (amount) {
                  setState(() {
                    p = amount;
                  });
                },
                value: p.toInt().toDouble(),
              ),


              Container(

                decoration: BoxDecoration(color: Colors.teal),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text(
                          'Loan Amount',

                          style: TextStyle(color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '${double.parse(p.toStringAsFixed(2))} \Rs ',
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
                max: 35,
                onChanged: (rate) {
                  setState(() {
                    r = rate;
                  });
                },
                value: r,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.teal),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Intrest Rate',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${double.parse(r.toStringAsFixed(2))}\%',
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
                max: 24,
                onChanged: (Tenor) {
                  setState(() {
                    n = Tenor;
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
                        'Tenor',
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
                onPressed: EMICalculation,
              ),
              Text('the total amount is ${double.parse(emi.toStringAsFixed(2))}',
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