import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MyFirstExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Screen Example',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Registration'),
          ),
          body: Material(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_circle_outlined),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).canvasColor,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      child: Text("LOGIN"),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
