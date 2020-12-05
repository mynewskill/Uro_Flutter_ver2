import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:uro_control/home_page_logo.dart';
import 'package:uro_control/keepMyCode.dart';
import 'package:uro_control/my_strings.dart';
import 'package:uro_control/test_page.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // set portrait mode only
  runApp(UroControlMain());
}

class UroControlMain extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      title: MyStrings.appName,
      // MyStrings class is the equivalent of res/string in Android
      initialRoute: '/',
      // alias to main page for routes
      routes: {
        // '/': (context) => UroControlMain(),
        '/second': (context) => SecondPage(),
        '/test': (context) => TestPage()
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
        // Color(0xff4BAAC5)
        primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Geometria'
          ),
            headline2: TextStyle(fontSize: 48.0, fontFamily: 'NerkoOne',
                fontWeight: FontWeight.bold
            )
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Uro Control'),
    );
  }
}

