import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:uro_control/my_strings.dart';
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SharedPreferences prefs;
  // SharedPreferences field

  final weightController = TextEditingController();
  final tallController = TextEditingController();
  final ageController = TextEditingController();
  // text controllers

  String ageValue = 'age';
  String tallValue = 'tall';
  String weightValue = 'weight';
  String sexValue = 'sex';
  // fields for saving in SharedPreferences


  List<String> sexList = const ["Мужской", "Женский"];
  // list of strings for DropDownButton with Sex choice

  String _dropdownValue = "Мужской";
  // default value for DropDownButton

  initState() {
    super.initState();
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
    _dropdownValue = prefs.getString(sexValue) ?? "Error string";
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Color(0xff4BAAC5), Color(0xff7076B0)])),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 75.0),
                child: Text('${MyStrings.appName}',style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontFamily: 'Geometria',
                  fontWeight: FontWeight.w500,
                ),),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        // set amount of space
                        mainAxisAlignment: MainAxisAlignment.center,
                        // set alignment in screen
                        children: [
                          _fieldPool(label: "Вес", controllerName: weightController,
                              shaPrefValue: weightValue, hint: "в килограммах"),
                          _fieldPool(label: "Рост", controllerName: tallController,
                              shaPrefValue: tallValue, hint: "в сантиметрах"),

                          // DropdownButton<String>(
                          //   value: _dropdownValue,
                          //   isExpanded: true,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _dropdownValue = value;
                          //     });
                          //   },
                          //   items: sexList.map<DropdownMenuItem<String>>((String val) {
                          //     return DropdownMenuItem<String>(
                          //       value: val,
                          //       child: Text(val),
                          //     );
                          //   }).toList(),
                          // ),
                          _fieldPool(label: "Возраст", controllerName: ageController,
                              shaPrefValue: ageValue),

                          ElevatedButton(
                            child: Text("SVG pictures"),
                            onPressed: () {
                              Navigator.pushNamed(context, '/test');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

              ),
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
        //TODO: make check if value isSet or not
      },
      decoration: InputDecoration(
// border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}