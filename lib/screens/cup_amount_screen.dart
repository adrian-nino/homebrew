import 'package:flutter/material.dart';
import 'package:homebrew/utils/coffee_tools.dart';


import 'recommended_screen.dart';

class CupAmountScreen extends StatefulWidget {
  CoffeeTools session;
  CupAmountScreen(this.session);
  @override
  _CupAmountScreenState createState() => _CupAmountScreenState();
}


class _CupAmountScreenState extends State<CupAmountScreen> {
  final cupAmount = TextEditingController();
  bool isValid = false;
  void initState() {
    super.initState();
    cupAmount.addListener(changeOnPressed);
  }
  void changeOnPressed() {
    setState(() {
      if (cupAmount.text == null) {
        isValid = false;
       }
      isValid = int.tryParse(cupAmount.text) != null && int.tryParse(cupAmount.text) > 0;
    });
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: Key('back-btn'),
          icon: Icon(
            Icons.arrow_back_ios
          ),
          onPressed: () {
            Navigator.pop(context);
          }
        )
      ),
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
                    key: Key('text-box'),
                    controller: cupAmount,
                    keyboardType: TextInputType.number,
                  )
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    key: Key('continue2-btn'),
                    child: Text("Continue"),
                    onPressed: !isValid ? null : () {
                      widget.session.inputCups(int.parse(cupAmount.text));
                      Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => RecommendedScreen(widget.session)));
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