import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uro_control/home_page_logo.dart';
import 'package:uro_control/my_strings.dart';

void main() {
  runApp(UroControlMain());
}

class UroControlMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyStrings.appName,
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
    const List<String> entries = <String>['A', 'B', 'C'];
    const List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _fieldPool(label: "Вес", hint: "в килограммах", focus: true)
          ],
        ),
      )
          );
  }

}

// Container(
// alignment: Alignment.center,
// decoration: BoxDecoration(
// border: Border.all(color: Colors.amberAccent, width: 6.0),
// ),
// child: Text(
// "Some Text Here"
// ),
// )

TextField _fieldPool({String label, String hint, int maxLen=3, bool focus}) {
  return TextField(
    autofocus: focus,
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    maxLength: maxLen,
    decoration: InputDecoration(
// border: OutlineInputBorder(),
      labelText: label,
      hintText: hint,
    ),
  );
}





