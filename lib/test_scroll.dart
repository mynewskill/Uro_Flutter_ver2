import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollTest extends StatefulWidget {
  @override
  _ScrollTestState createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  String dropDownValue = "Мужской";
  List<String> sexList = const ["Мужской", "Женский"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        // gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.topRight,
        //     colors: [Color(0xff4BAAC5), Color(0xff7076B0)])


        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff4BAAC5), Color(0xff7076B0)])
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                  )
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)
                        )
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: Column(
                      // Flexible(
                      //   flex: 9,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _fieldPool(label: "Вес", hint: "в килограммах", focus: true),
                        _fieldPool(label: "Рост", hint: "в сантиметрах"),
                        DropdownButton<String>(
                          value: dropDownValue,
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value;
                            });
                          },
                          items: sexList.map<DropdownMenuItem<String>>((String val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          }).toList(),
                        ),
                        _fieldPool(label: "Возраст", txtInputAction: TextInputAction.done),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xff4BAAC5),
                            textColor: Colors.white,
                            minWidth: double.infinity,
                            // infinity get all width of its parent
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(89.0)
                            ),
                            // padding: EdgeInsets.fromLTRB(80.0, 15.0, 80.0, 15.0),
                            child: Text("Continue", style: TextStyle(
                                fontSize: 18.0
                            ),),
                          ),
                        )
                        // FlatButton(
                        //   color: Color(0xff4BAAC5),
                        //   textColor: Colors.white,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(89.0)
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0,15.0),
                        //     child: Text("Продолжить"),
                        //   ),
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, '/test');
                        //   },
                        //   ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  TextField _fieldPool({String label, TextEditingController controllerName,
    shaPrefValue, String hint, int maxLen=3, bool focus=false, txtInputAction = TextInputAction.next}) {

    return TextField(
      autofocus: focus,
      textInputAction: txtInputAction,
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
          // labelStyle: TextStyle.,
          helperText: hint
      ),
    );
  }

}
