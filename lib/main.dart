import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uro_control/home_page_logo.dart';

void main() {
  runApp(UroControlMain());
}

class UroControlMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        // '/': (context) => UroControlMain(),
        '/second': (context) =>SecondPage()
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline2: TextStyle(fontSize: 48.0, fontFamily: 'NerkoOne',
              fontWeight: FontWeight.bold
          )
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        automaticallyImplyLeading: false,
      ),
      body:Center(

        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(width: 5, color: Colors.amberAccent)
          // ),
          margin: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Second screen Navigation"
                ),
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 3,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'Вес',
                  hintText: 'в килограммах',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}




