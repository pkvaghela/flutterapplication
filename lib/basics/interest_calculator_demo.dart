import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class InterestCalculatorContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Simple Interest Calculator Demo",
        home: InterestCalculator()

    );
  }
}
class  InterestCalculator extends StatefulWidget {
  const  InterestCalculator({Key? key}) : super(key: key);

  @override
  _InterestCalculatorState createState() => _InterestCalculatorState();
//InterestCalculatorState createstate(){
   // _InterestCalculatorState state = _InterestCalculatorState();
  }



class _InterestCalculatorState extends State< InterestCalculator> {
  String result = ' ';
  double amount = 0.0, rate = 0.0, year = 0.0;
  TextEditingController txtamount = new TextEditingController();
  TextEditingController txtrate = new TextEditingController();
  TextEditingController txtyear = new TextEditingController();

  @override
  void initState(){
    super.initState();
    txtamount.addListener(() {
      if (txtamount.text != null)
        amount = double.parse(txtamount.text);
      else
        amount = 0.0;
    });
    txtrate.addListener(() {
      if(txtrate .text != null)
        rate = double.parse(txtrate.text);
      else
        rate = 0.0;
    });
    txtyear.addListener(() {
      if(txtrate.text !=null)
        year = double.parse(txtyear.text);
      else
        year = 0.0;
    });

    }
    @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Material(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: txtamount,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  icon: Icon(Icons.keyboard_alt),
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        controller: txtrate,
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                          icon: Icon(Icons.keyboard_alt),
                          labelText: "Rate",
                          labelStyle: TextStyle(
                            color: Color(0xFF6200EE),
                          ),

                        ),
                      ),
                  ),
                  Expanded(
                      child: TextFormField(
                        controller: txtyear,
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                          icon: Icon(Icons.keyboard_alt),
                          labelText: "Year",
                          labelStyle: TextStyle(
                            color: Color(0xFF6200EE),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ElevatedButton(
                  onPressed:(){
                    CalculateResult();
                  },
                child: Text('Calculate Interest'),
              ),
              Text(result,textDirection: TextDirection.ltr,)
              


            ],
          ),
        ),
      ),

    );

  }
  void CalculateResult()
  {

    double interest = (amount * rate * year)/100;
    setState(() {
      result = "simple interest = $interest";
    });
    }
}
