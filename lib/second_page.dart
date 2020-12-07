import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uro_control/my_strings.dart';
import 'package:dropdownfield/dropdownfield.dart  ';

class SecondSecondPage extends StatefulWidget {
  @override
  _SecondSecondPageState createState() => _SecondSecondPageState();
}

class _SecondSecondPageState extends State<SecondSecondPage> {
  SharedPreferences prefs;
  // SharedPreferences field

  final weightController = TextEditingController();
  final tallController = TextEditingController();
  final ageController = TextEditingController();
  final textFieldControl = TextEditingController();
  // text controllers

  String ageValue = 'age';
  String tallValue = 'tall';
  String weightValue = 'weight';
  String sexValue = 'sex';
  // fields for saving in SharedPreferences


  List<String> sexList = const ["Мужской", "Женский"];
  // list of strings for DropDownButton with Sex choice
  String _dropDownValue;
  // default value for DropDownButton

  initState() {
    super.initState();
    _dropDownValue = sexList.first;
    loadTextInputs();
    loadDropDownInput();
  } // initial load block for getting SharedPreferences

  loadTextInputs() async {
    prefs = await SharedPreferences.getInstance();

    weightController.text = prefs.getString(weightValue);
    tallController.text = prefs.getString(tallValue);
    ageController.text = prefs.getString(ageValue);
  }

  loadDropDownInput() async {
    prefs = await SharedPreferences.getInstance();
    _dropDownValue = prefs.getString(sexValue) ?? "";
  }

  void dispose() {
    weightController.dispose();
    tallController.dispose();
    ageController.dispose();
    super.dispose();
  }

  final String dogUrl = 'https://www.svgrepo.com/show/2046/dog.svg';
  final String dogFoodUrl = 'https://www.svgrepo.com/show/3682/dog-food.svg';

  @override
  Widget build(BuildContext context) {
    // start build a new context for Scaffold

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Second Screen"),
      //   automaticallyImplyLeading: false,
      // ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            // hide keyboard when tap outside input text field
          },
          child: Container(
            // background color setter
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xff4BAAC5), Color(0xff7076B0)])
            ),
            child: SafeArea(
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
                            padding: const EdgeInsets.symmetric(vertical: 25.0),
                            child: Text (appName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: mainTextFamily,
                                  fontSize: 40.0
                              ),
                            ),
                          )
                      )
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // Flexible(
                      //   flex: 1,
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      // padding block
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)
                          )
                      ),
                      child: Flexible(
                        flex: 1,
                        child: CustomScrollView(
                          physics: BouncingScrollPhysics(),
                          slivers: [
                            SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      // Flexible(
                                      //   flex: 1,
                                      //   child: Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(putYourData,style: TextStyle(
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
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          _fieldPool(label: "Вес", hint: "кг"),
                                          _fieldPool(label: "Рост", hint: "см"),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20.0),
                                            child: FormField<String>(
                                                builder: (FormFieldState<String> state) {
                                                  return InputDecorator(
                                                      decoration: InputDecoration(
                                                          disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                                                          labelText: "Пол",
                                                          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                                                      isEmpty: _dropDownValue == '',
                                                      child: DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                          value: _dropDownValue,
                                                          isDense: true,
                                                          isExpanded: true,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              state.didChange(value);
                                                              setState(() {
                                                                _dropDownValue = value;
                                                              });
                                                            });
                                                          },
                                                          items: sexList.map<DropdownMenuItem<String>>((String val) {
                                                            return DropdownMenuItem<String>(
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

                                          _fieldPool(label: "Возраст",txtInputAction: TextInputAction.done),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                                            child: MaterialButton(
                                              onPressed: () async {
                                                prefs = await SharedPreferences.getInstance();
                                                await prefs.clear();
                                              },
                                              color: Color(0xff4BAAC5),
                                              textColor: Colors.white,
                                              minWidth: double.infinity,
                                              // infinity get all width of its parent
                                              padding: EdgeInsets.symmetric(vertical: 10.0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(89.0)
                                              ),
                                              // padding: EdgeInsets.fromLTRB(80.0, 15.0, 80.0, 15.0),
                                              child: Text(continueButton, style: TextStyle(
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
                                    ),
                                  ],
                                )

                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  TextField _fieldPool({String label, TextEditingController controllerName,
    shaPrefValue, String hint, int maxLen=3, bool focus=false, txtInputAction = TextInputAction.next}) {

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
          labelStyle: TextStyle(color: Colors.red),
          hintStyle: TextStyle(color: Colors.green),
          // helperText: hint
      ),
    );
  }

}

// Padding(
// padding: const EdgeInsets.only(top: 20.0),
// child: FormField<String>(
// builder: (FormFieldState<String> state) {
// return InputDecorator(
// decoration: InputDecoration(
// disabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
// labelText: "Пол",
// errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
// isEmpty: _dropDownValue == '',
// child: DropdownButtonHideUnderline(
// child: DropdownButton<String>(
// value: _dropDownValue,
// isDense: true,
// isExpanded: true,
// onChanged: (value) {
// setState(() {
// state.didChange(value);
// setState(() {
// _dropDownValue = value;
// });
// });
// },
// items: sexList.map<DropdownMenuItem<String>>((String val) {
// return DropdownMenuItem<String>(
// value: val,
// child: Text(val),
// );
// }).toList(),
// ),
// )
// );
// }
// ),
// )
