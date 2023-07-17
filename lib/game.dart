import 'package:flutter/material.dart';

class MyGamePage extends StatefulWidget {
  @override
  _MyGamePageState createState() => _MyGamePageState();
}

class _MyGamePageState extends State<MyGamePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 100, 
                width: 50,
              )
            ],
          )
        ),
      )
    );
  }
}
