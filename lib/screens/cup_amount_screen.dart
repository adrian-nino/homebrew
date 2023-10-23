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
            Icons.arrow_back_ios_new
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xFF4C748B)
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
      ),
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
                      "How many cups would you like?",
                      key: Key('cup-amount-question'),
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xFF4C748B),
                      ),
                    )
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      key: Key('text-box'),
                      controller: cupAmount,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF4C748B),
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Color(0xFF4C748B)),
                          borderRadius: BorderRadius.circular(10.0),
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
                            key: Key("continue2-btn"),
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: !isValid ? Color(0xFF757474) : Color(0xFFFFFFFF),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            backgroundColor: !isValid ? Color(0xFFE2E2E2) : Color(0xFF4C748B),
                          ),
                          onPressed: !isValid ? null : () {
                              widget.session.inputCups(int.parse(cupAmount.text));
                              Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => RecommendedScreen(widget.session)));
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