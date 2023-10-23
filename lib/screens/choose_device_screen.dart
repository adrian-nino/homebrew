import 'package:flutter/material.dart';
import 'package:homebrew/utils/coffee_tools.dart';

import 'cup_amount_screen.dart';

class ChooseDeviceScreen extends StatefulWidget {
  CoffeeTools session;
  ChooseDeviceScreen(this.session);
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  String selectedMachine = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFFFFFFFF),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "What coffee maker are you using?",
                        key: Key('coffee-maker-question'),
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Color(0xFF4C748B)
                        ),
                        ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          border: Border.all(
                            width: 2,
                            color: Color(0xFF4C748B)
                            ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              RadioListTile(
                                key: Key("french-press-btn"),
                                value: "French_Press",
                                groupValue: selectedMachine,
                                activeColor: Color(0xFF4C748B),
                                controlAffinity: ListTileControlAffinity.trailing,
                                title: Text(
                                  "French Press",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xFF4C748B)
                                  ),
                                  ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedMachine = value;
                                  });
                                }
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                color: Color(0xFF4C748B)
                              ),
                              RadioListTile(
                                key: Key("drip-machine-btn"),
                                value: "Drip_Machine",
                                groupValue: selectedMachine,
                                activeColor: Color(0xFF4C748B),
                                controlAffinity: ListTileControlAffinity.trailing,
                                title: Text(
                                  "Drip Machine",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xFF4C748B)
                                  ),
                                  ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedMachine = value;
                                  });
                                }
                              ),
                            ]
                          ),
                        ),
                      )
                    ),

                    SizedBox(
                      width: 280,
                      height: 56,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          child: Text(
                            "Continue",
                            key: Key("continue-btn"),
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: selectedMachine == '' ? Color(0xFF757474) : Color(0xFFFFFFFF),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            backgroundColor: selectedMachine == '' ? Color(0xFFE2E2E2) : Color(0xFF4C748B),
                          ),
                          onPressed: selectedMachine == '' ? null : () {
                              widget.session.inputMachine(selectedMachine);
                              Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => CupAmountScreen(widget.session)));
                          },
                        )
                      ),
                    )
                  ]
              )
              ),
          ),
        )
          
    );
  }
}
