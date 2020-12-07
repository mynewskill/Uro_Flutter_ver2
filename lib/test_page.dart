import 'package:flutter/material.dart';
import 'my_strings.dart';

class TestPage extends StatefulWidget {

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String dropDownValue = "Мужской";
  List<String> sexList = const ["Мужской", "Женский"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                                      child: Text(MyStrings.putYourData,style: TextStyle(
                                        color: Color(0xff4BAAC5),
                                        fontSize: 18.0,
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
                                            child: Text(MyStrings.continueButton, style: TextStyle(
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
        )
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


