import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';


//FIXME: it's the main page with SplashScreen picture
//need to now how to align with percent units


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bool isSettingDone = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        if(isSettingDone) Navigator.pushNamed(context, '/test');
        // change if you need to go to a page after SplashScreen
      });
    });
  }

  // void widgetsBinding() => WidgetsBinding;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    Container appTextContainer() {
      return Container(
        // decoration: BoxDecoration(
        //   color: Colors.blueGrey
        // ),
        alignment: Alignment.bottomCenter,
        // padding: EdgeInsets.only(bottom: 25.0),
        child: Text(
          "${widget.title}",
          style: TextStyle(
              fontFamily: "Geometria",
              fontSize: 46.0,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      );
    }

    Container appLogoContainer() {
      return Container(
        child: Image.asset('images/logo.png', width: 150, height: 150,),
      );
    }

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
                colors: [Color(0xff4BAAC5), Color(0xff7076B0)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
                child: appTextContainer()
            ),
            Expanded(
              flex: 4,
                child: appLogoContainer()
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Colors.amberAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/test');
                      // change to go to the needed page after SplashScreen
                    },
                    child: Text("Click me to go further"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}