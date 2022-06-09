import 'package:flutter/cupertino.dart';

class MySecondExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Bramha",textDirection: TextDirection.ltr,),
          Text("Vishnu",textDirection: TextDirection.ltr,),
          Text("Shiv",textDirection: TextDirection.ltr,),
        ],
      ),
    );
  }
}
