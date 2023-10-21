import 'package:flutter/material.dart';

import 'cup_amount_screen.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  String selectedMachine = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("What coffee maker are you using?", key: Key('coffee-maker-question')),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.orange,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            RadioListTile(
                              key: Key("french-press-btn"),
                              title: Text("French Press"),
                              value: "French_Press",
                              groupValue: selectedMachine,
                              onChanged: (value) {
                                setState(() {
                                  print("frenchy");
                                  selectedMachine = value;
                                });
                              }
                            ),
                            RadioListTile(
                              title: Text("Drip Machine"),
                              value: "Drip_Machine",
                              groupValue: selectedMachine,
                              onChanged: (value) {
                                setState(() {
                                  print("drippy");
                                  selectedMachine = value;
                                });
                              }
                            )
                          ]
                        ),
                      ),
                    )
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text("Continue", key: Key("continue-btn")),
                      onPressed: selectedMachine == '' ? null : () {
                          print(selectedMachine);
                          Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CupAmountScreen()));
                      },
                    )
                  )
                ]
            )
            ),
        )
          
    );
  }
}
