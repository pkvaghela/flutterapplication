import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon.dart';


class MyTextFormField extends StatefulWidget {
  String label = '';
  var controller = TextEditingController();
  late Icon icon;

  MyTextFormField(String label, TextEditingController controller,
      [IconData ic = Icons.keyboard_alt]) {
    this.label = label;
    this.controller = controller;
    this.icon = Icon(ic);
  }

  @override
  _MyTextFormFieldState createState() =>
      _MyTextFormFieldState(label, controller, icon);
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  String label = '';
  var controller = TextEditingController();
  late Icon icon;

  _MyTextFormFieldState(
      String label, TextEditingController controller, Icon icon) {
    this.label = label;
    this.controller = controller;
    this.icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      cursorColor: Theme.of(context).cursorColor,
      decoration: InputDecoration(
        icon: this.icon,
        labelText: label,
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
      ),
    );
  }
}

class MyCheckBox extends StatefulWidget {
  String label = '';
  bool isChecked = false;
  late _MyCheckBoxState state;

  MyCheckBox(String label, bool isChecked) {
    this.label = label;
    this.isChecked = isChecked;
    state = _MyCheckBoxState(label, isChecked); //this line is required to avoid late initlization error
    print("constructor called $label");
  }

  @override
  State<StatefulWidget> createState() {
    state = _MyCheckBoxState(label, isChecked);
    return state;
  }
}

class _MyCheckBoxState extends State<MyCheckBox> {
  String label = '';
  bool isChecked = false;

  _MyCheckBoxState(String label, bool isChecked) {
    this.label = label;
    this.isChecked = isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(label),
        leading: Checkbox(
          onChanged: (bool? value) {
            setState(() {
              if (value != null)
                isChecked = value;
              print("current status ${this.isChecked} of ${this.label}");
            });
          },
          value: isChecked,
        ),
      ),
    );
  }
  bool isItChecked(){
    return isChecked;
  }
}
