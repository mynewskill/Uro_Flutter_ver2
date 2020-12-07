import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uro_control/home_page_logo.dart';
import 'package:uro_control/my_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uro_control/second_page.dart';
import 'package:uro_control/test_page.dart';
import 'package:flutter/services.dart';
import 'test_scroll.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(UroControlMain());
}

class UroControlMain extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      initialRoute: '/',
      routes: {
        // '/': (context) => UroControlMain(),
        '/second': (context) => SecondSecondPage(),
        '/test': (context) => TestPage(),
        '/scroll': (context) => ScrollTest()
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

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final weightController = TextEditingController();
  final tallController = TextEditingController();
  final ageController = TextEditingController();

  initState() {
    super.initState();
    loadTextInputs();
  }

  loadTextInputs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weightController.text = prefs.getString('weight');
    tallController.text = prefs.getString('tall');
    ageController.text = prefs.getString('age');
  }

  @override
  Widget build(BuildContext context) {

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
              _fieldPool(label: "Вес", controllerName: weightController,
                  shaPrefValue: 'weight', hint: "в килограммах"),
              _fieldPool(label: "Рост", controllerName: tallController,
                  shaPrefValue: 'tall', hint: "в сантиметрах"),
              _fieldPool(label: "Возраст", controllerName: ageController,
                  shaPrefValue: 'age'),
            ],
          ),
        )
    );
  }
  TextField _fieldPool({String label, TextEditingController controllerName,
    shaPrefValue, String hint, int maxLen=3, bool focus=false}) {

    return TextField(
      autofocus: focus,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: controllerName,
      maxLength: maxLen,
      onSubmitted: (value) async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(shaPrefValue, value);
      },
      decoration: InputDecoration(
// border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
    );
  }
  }


