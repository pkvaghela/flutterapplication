import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySevanExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forget Password Screen",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Forgot Password'),
        ),
        body: Material(
          child: Container(
            margin: EdgeInsets.all(25),
            child: Center(
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle_outlined),
                      labelText: "Enter Email Address",
                      labelStyle: TextStyle(
                        color: Color(0xFF6200EE),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text("Request Password reset"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text("Back to Sign in"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
