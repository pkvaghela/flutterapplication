import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySixExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Password Screen',
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Password'),
          actions: [
            Icon(Icons.lock),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Colors.purple,
        ),
        body: Material(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  TextFormField(

                    decoration: InputDecoration(
                      labelText: 'Current Password',
                      labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.visibility_outlined,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility_outlined),
                    ),
                  ),
                  TextFormField(

                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                      labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility_outlined),
                    ),
                  ),



                  OutlinedButton.icon(
                    onPressed: () {
                      labelStyle: TextStyle(color: Colors.purple);

                      // Respond to button press
                    },
                    icon: Icon(Icons.lock, size: 18,color: Colors.purple),
                    label: const Text("Change Password"),

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