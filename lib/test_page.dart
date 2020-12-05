import 'package:flutter/material.dart';
import 'my_strings.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          // background color setter
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff4BAAC5), Color(0xff7076B0)])
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(
                    // color: Colors.blueGrey,
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0,
                            bottom: 25.0
                        ),
                        child: Text (MyStrings.appName,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: MyStrings.mainTextFamily,
                              fontSize: 45.0
                          ),
                        ),
                      )
                  )
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      _fieldPool(label: "Вес", hint: "в килограммах"),
                      _fieldPool(label: "Рост", hint: "в сантиметрах"),
                      FlatButton(
                        color: Color(0xff4BAAC5),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(89.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0,15.0),
                          child: Text("Продолжить"),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/test');
                        },
                        ),
                    ],
                  ),
                ),
              )
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
      // controller: controllerName,
      maxLength: maxLen,
      onSubmitted: (value) async {
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setString(shaPrefValue, value);
        // //TODO: make check if value isSet or not
      },
      decoration: InputDecoration(
// border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
    );
  }


}


