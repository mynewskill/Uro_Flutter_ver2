import 'package:flutter/material.dart';
import 'package:uro_control/my_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SlidePage extends StatefulWidget {
  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  SharedPreferences prefs;
  // SharedPreferences field

  List<String> sexList = const ["Мужской", "Женский"];

  // list of strings for DropDownButton with Sex choice
  String _dropDownValue;

  // default value for DropDownButton

  initState() {
    super.initState();
    _dropDownValue = sexList.first;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly,
      children: [
        Padding(
          // Flexible(
          //   flex: 1,
          //   child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              putYourData, style: TextStyle(
              color: Color(0xff4BAAC5),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),),
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            // Flexible(
            //   flex: 9,
            mainAxisAlignment: MainAxisAlignment
                .spaceAround,
            children: [
              _fieldPool(label: "Вес", hint: "кг"),
              _fieldPool(label: "Рост", hint: "см"),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0),
                child: FormField<String>(
                    builder: (FormFieldState<
                        String> state) {
                      return InputDecorator(
                          decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle
                                          .none)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor
                                  )
                              ),
                              labelText: "Пол",
                              errorStyle: TextStyle(
                                  color: Colors
                                      .redAccent,
                                  fontSize: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius
                                    .circular(5.0),
                                // borderSide: BorderSide(
                                //   color: primaryColor
                                // )
                              )
                          ),
                          isEmpty: _dropDownValue ==
                              '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<
                                String>(
                              value: _dropDownValue,
                              isDense: true,
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                  state.didChange(
                                      value);
                                  setState(() {
                                    _dropDownValue =
                                        value;
                                  });
                                });
                              },
                              items: sexList.map<
                                  DropdownMenuItem<
                                      String>>((
                                  String val) {
                                return DropdownMenuItem<
                                    String>(
                                  value: val,
                                  child: Text(val),
                                );
                              }).toList(),
                            ),
                          )
                      );
                    }
                ),
              ),

              _fieldPool(label: "Возраст",
                  txtInputAction: TextInputAction
                      .done),

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
        ),
      ],
    );
  }

  TextField _fieldPool({String label, TextEditingController controllerName,
    shaPrefValue, String hint, int maxLen = 3, bool focus = false, txtInputAction = TextInputAction
        .next}) {
    return TextField(
      autofocus: focus,
      cursorColor: Colors.grey,

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
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: primaryColor,
                width: 1.5
            )
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            )
        ),
        labelText: label,
        alignLabelWithHint: true,
        // prefixText: "Hello World!",
        suffixText: hint,
        // labelStyle: TextStyle(color: Colors.red),
        // hintStyle: TextStyle(color: Colors.green),
        // helperText: hint
      ),
    );
  }
  }
