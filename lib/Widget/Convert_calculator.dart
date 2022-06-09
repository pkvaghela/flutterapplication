import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ConvertCalculatorContainer extends StatelessWidget {
  const ConvertCalculatorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "RadioButton Example",

      home: ConvertCalculator(),

    );
  }
}

class ConvertCalculator extends StatefulWidget {
  const ConvertCalculator({Key? key}) : super(key: key);

  @override
  State<ConvertCalculator> createState() => _ConvertCalculatorState();
}

class _ConvertCalculatorState extends State<ConvertCalculator> {
  double SelectedShape = 0.0;
  double CM = 0.0, Converted = 0.0;
  TextEditingController txtCM = TextEditingController();
  @override
  void initState() {
    super.initState();
    txtCM.addListener(() {
      if (txtCM.text != null)
        CM = double.parse(txtCM.text);
      else
        CM = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text("Convert Calculator"),
        backgroundColor: Colors.purpleAccent[400],
      ),
      body: Material(
        child: Container(
            child: Column(
              children: [
                TextFormField(
                  controller: txtCM,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.check),
                    labelText: "CM",
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
                          "MT",
                          textDirection: TextDirection.ltr,
                        ),
                        leading: Radio(
                          value: 1,
                          groupValue: SelectedShape,
                          onChanged: (value) {
                            setState(() {
                              SelectedShape = double.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Inch",
                          textDirection: TextDirection.ltr,
                        ),
                        leading: Radio(
                          value: 2,
                          groupValue: SelectedShape,
                          onChanged: (value) {
                            setState(() {
                              SelectedShape = double.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Foot",
                          textDirection: TextDirection.ltr,
                        ),
                        leading: Radio(
                          value: 3,
                          groupValue: SelectedShape,
                          onChanged: (value) {
                            setState(() {
                              SelectedShape = double.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    ConvertedCalculator();
                  },
                  child: Text('Converted'),
                )
              ],
            )),
      ),
    );
  }

  void ConvertedCalculator() {
    print("Selected Shape = $SelectedShape");
    print("CM=$CM");
    if (SelectedShape == 1) {
      Converted = CM / 100;
    } else if (SelectedShape == 2) {
      Converted = CM /2.54;
    } else if (SelectedShape == 3){
      Converted = CM/30.48;
    }
    SnackBar snackBar = SnackBar(
      content: Text("Converted = $Converted"),
    );
    //display snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
