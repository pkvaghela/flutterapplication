import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text('Flemingo Tailor'),
        backgroundColor: Colors.red[400],
      ),
      body: Column(
          children:[
            Text("Kiranbhai vaghela",textDirection: TextDirection.ltr,),
            Image(
              image: NetworkImage('https://i1.pickpik.com/photos/214/927/603/flamingo-bird-pink-red-preview.jpg'),

            ),]
      ),

    ),
  ),
  );
}