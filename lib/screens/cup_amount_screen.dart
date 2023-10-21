import 'package:flutter/material.dart';

class CupAmountScreen extends StatefulWidget {
  @override
  _CupAmountScreenState createState() => _CupAmountScreenState();
}


class _CupAmountScreenState extends State<CupAmountScreen> {
  final cupAmount = TextEditingController();
  bool isFilled = false;
  void initState() {
    super.initState();
    cupAmount.addListener(changeOnPressed);
  }
  void changeOnPressed() {
    setState(() {
      isFilled = cupAmount.text != "";
    });
  }


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
                  child: Text("How many cups would you like?", key: Key('cup-amount-question')),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: cupAmount,
                    keyboardType: TextInputType.number,
                  )
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Text("Continue"),
                    onPressed: !isFilled ? null : () {
                      print("continue");
                      print(isFilled);
                      print(cupAmount.text);
                    }
                  )
                )
              ]
          )
          ),
      )
        
  );
}

}