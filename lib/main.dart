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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SecondPage extends StatefulWidget{

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
//TODO: remove Lists after complete dropdown button
//     const List<String> entries = <String>['A', 'B', 'C'];
//     const List<int> colorCodes = <int>[600, 500, 100];
//     String _dDButtonNowValue = "Мужчина";

    return Scaffold(
        body: Builder(builder: (context) {
          return Center(
            child: FlatButton(
              onPressed: () {
                SnackBar mySnackBar = SnackBar(
                  content: Text("Simple Text"),
                );
                Scaffold.of(context).showSnackBar(mySnackBar);
              },
              child: Text("Click Me"),
            ),
          );
        }));
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("Second Screen"),
    //       automaticallyImplyLeading: false,
    //     ),
    //     body: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 35.0),
    //       child: ElevatedButton(
    //         onPressed: () {
    //           final snackBar = SnackBar(
    //             content: Text('Yay! A SnackBar!'),
    //             action: SnackBarAction(
    //               label: 'Undo',
    //               onPressed: () {
    //                 // Some code to undo the change.
    //               },
    //             ),
    //           );
    //
    //           // Find the Scaffold in the widget tree and use
    //           // it to show a SnackBar.
    //           Scaffold.of(context).showSnackBar(snackBar);
    //         },
    //         child: Text('Show SnackBar'),
    //       ),
    //       // child: Column(
    //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       //   children: [
    //       //     _fieldPool(label: "Вес", hint: "в килограммах", focus: true),
    //       //     _fieldPool(label: "Рост", hint: "в сантиметрах"),
    //       //     DropdownButtonFormField<String>(
    //       //       value: _dDButtonNowValue,
    //       //       isExpanded: true,
    //       //       onChanged: (String newValue) {
    //       //         setState(() {
    //       //           _dDButtonNowValue = newValue;
    //       //         });
    //       //       },
    //       //       items: <String>["Мужчина", "Женщина"]
    //       //           .map<DropdownMenuItem<String>>(
    //       //               (String value) {
    //       //             return DropdownMenuItem(
    //       //               value: value,
    //       //               child: Text(value),
    //       //             );
    //       //           }
    //       //       ).toList(),
    //       //     ),
    //       //     _fieldPool(label: "Возраст"),
    //       //   ],
    //       // ),
    //     )
    // );
  }
}

// method constructor pool fields
TextField _fieldPool({String label, String hint, int maxLen=3, bool focus=false}) {
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

// Container(
// alignment: Alignment.center,
// decoration: BoxDecoration(
// border: Border.all(color: Colors.amberAccent, width: 6.0),
// ),
// child: Text(
// "Some Text Here"
// ),
// )





