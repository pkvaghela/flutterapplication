import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AreaCalculatorContainer extends StatelessWidget {
  const AreaCalculatorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RadioButton Demo",
      home: AreaCalculator(),
    );
  }
}

class AreaCalculator extends StatefulWidget {
  const AreaCalculator({Key? key}) : super(key: key);

  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  int SelectedShape = 0;
  double height = 0, width_or_base = 0, area = 0;
  var txtheight = new TextEditingController();
  var txtwidth_or_base = new TextEditingController();

  @override
  void initState() {
    super.initState();
    txtheight.addListener(() {
      if (txtheight.text != null)
        height = double.parse(txtheight.text);
      else
        height = 0.0;
    });
    txtwidth_or_base.addListener(() {
      if (txtwidth_or_base.text != null)
        width_or_base = double.parse(txtwidth_or_base.text);
      else
        width_or_base = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area Calculator'),
      ),
      body: Material(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: txtheight,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.keyboard_alt),
                    labelText: 'Height',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                  ),
                ),
                TextFormField(
                  controller: txtwidth_or_base,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.keyboard_alt),
                    labelText: 'Width/Base',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Rectangle",
                          textDirection: TextDirection.ltr,
                        ),
                        leading: Radio(
                          value: 1,
                          groupValue: SelectedShape,
                          onChanged: (value) {
                            setState(() {
                              SelectedShape = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Triangle",
                          textDirection: TextDirection.ltr,
                        ),
                        leading: Radio(
                          value: 2,
                          groupValue: SelectedShape,
                          onChanged: (value) {
                            setState(() {
                              SelectedShape = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    CalculateArea();
                  },
                  child: Text('Calculate Area'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void CalculateArea() {
    print("Selected Shape = $SelectedShape");
    print("height = $height ,width_or_base = $width_or_base");
    if (SelectedShape == 1) {
      area = height * width_or_base;
    } else if (SelectedShape == 2) {
      area = height * width_or_base * 0.5;
    }
    SnackBar snackBar = SnackBar(
      content: Text("Area = $area"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
