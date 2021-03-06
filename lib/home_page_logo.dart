import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uro_control/main.dart';

import 'my_strings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
  }
    Future delay() async {
      await new Future.delayed(new Duration(milliseconds: 1500), ()
      {
        setState(() {
          Navigator.of(context).pushNamed("/second");
        });
      });}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Color(0xff4BAAC5), Color(0xff7076B0)]
            )
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                // decoration: BoxDecoration(
                //   color: Colors.blueGrey
                // ),
                padding: EdgeInsets.only(bottom: 50.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    appName,
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 46.0,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset('images/logo.png')
                )
            ),
            RaisedButton(
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/test');
              }, child: Text("Go further"),
            )
          ],
        ),
      ),
    );
  }
}