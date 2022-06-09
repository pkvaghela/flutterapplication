import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScaffoldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Login screen"),
            ),
            body: Material(
              child: Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            icon: Icon(Icons.favorite),
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                          ),
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                          ),
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            icon: Icon(Icons.keyboard_alt),
                            labelText: 'Forget Password',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.account_circle, size: 18),
                          label: Text("Login"),
                        )
                      ],
                    ),
                  )),
            )));
  }
}
