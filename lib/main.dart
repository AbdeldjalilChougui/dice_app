import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: SafeArea (
        child: Scaffold (
          appBar: AppBar (
            title: Center (
              child: Text(
                "Dice App",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'serif',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Colors.pink[100],
          ),
          backgroundColor: Colors.pinkAccent[200],
          body : ListView(
            children: <Widget>[
              SizedBox(height: 20,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row (
                      children : <Widget> [
                        Expanded (
                            child: FlatButton(
                              onPressed: () {
                                changeDiceFace();
                              },
                              child: Image.asset("images/dice$leftDiceNumber.png"),
                            )
                        ),
                        Expanded (
                          child :FlatButton(
                            onPressed: () {
                              changeDiceFace();
                            },
                            child: Image(
                              image:AssetImage("images/dice$rightDiceNumber.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    RaisedButton(
                      color: Colors.deepPurpleAccent[100],
                      onPressed: () {
                        setState(() {
                          leftDiceNumber = 1;
                          rightDiceNumber = 1;
                        });
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}