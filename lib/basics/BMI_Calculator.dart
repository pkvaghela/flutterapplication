import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class  MyBmiCalculatorContainer  extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: ("Simple BMI Calculator Demo"),
        home: BmiCalculator()

    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  String result = ' ';
  double Height = 0.0,
      Width = 0.0;
  TextEditingController txtHeight = new TextEditingController();
  TextEditingController txtWidth = new TextEditingController();

  @override
  void initState() {
    super.initState();
    txtHeight.addListener(() {
      if (txtHeight.text != null)
        Height = double.parse(txtHeight.text);
      else
        Height = 0.0;
    });
    txtWidth.addListener(() {
      if (txtWidth.text !=null)
        Width = double.parse(txtWidth.text);
      else
        Width = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Material(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme
                      .of(context)
                      .cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.height),
                    labelText: 'Height',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                  ),

                ),
                TextFormField(
                  controller: txtWidth,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme
                      .of(context)
                      .cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.west_outlined),
                    labelText: 'Width',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                  ),

                ),
                ElevatedButton(
                  onPressed: () {
                    CalculateResult();

                  },
                  child: Text('BMI Calculate'),
                ),
                Text(result, textDirection: TextDirection.ltr,)

              ],
            ),
          ),
        ),
      ),

    );
  }

  void CalculateResult() {
    {

      double BMI = Width/(Height * Height / 10000);
      setState(() {
        result = "Simple BMI = $BMI";
      });
    }
  }
}
