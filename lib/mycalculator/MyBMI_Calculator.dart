import 'package:flutter/material.dart';

class MyBmicalculator extends StatefulWidget {
  const MyBmicalculator({Key? key}) : super(key: key);

  @override
  _MyBmicalculatorState createState() => _MyBmicalculatorState();
}

class _MyBmicalculatorState extends State<MyBmicalculator> {
  String result = "";
  double Height = 0.0, Width = 0.0;
  TextEditingController txtHeight = new TextEditingController();
  TextEditingController txtWidth = new TextEditingController();

  @override
  void initState() {
    super.initState();
    txtHeight.addListener(() {
      if (txtHeight != null)
        Height = double.parse(txtHeight.text);
      else
        Height = 0.0;
    });

    txtWidth.addListener(() {
      if (txtWidth.text != null)
        Width = double.parse(txtWidth.text);
      else
        Width = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "bmi calculator",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff34a0a4),
          title: Text("Bmi Calculator"),
          centerTitle: true,
        ),
        body: Material(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/register.png',
                    ),
                    fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: txtHeight,
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                        icon: Icon(Icons.height),
                        labelText: "Height",
                        labelStyle:
                            TextStyle(color: Color(0xFF6200EE), fontSize: 24)),
                  ),
                  TextFormField(
                    controller: txtWidth,
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                        icon: Icon(Icons.west_outlined),
                        labelText: "Width",
                        labelStyle:
                            TextStyle(color: Color(0xFF6200EE), fontSize: 24)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CalculateResult();
                    },
                    child: Text(
                      "BMI Calculate",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    result,
                    textDirection: TextDirection.ltr,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void CalculateResult() {
    double BMI = Width / (Height * Height / 10000);
    setState(() {
      result = "simple bmi = $BMI";
    });
  }
}
