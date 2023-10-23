import 'package:flutter/material.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/utils/coffee_tools.dart';


class RecommendedScreen extends StatefulWidget {
  CoffeeTools session;
  RecommendedScreen(this.session);
  @override
  _RecommendedScreenState createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {
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
                Spacer(),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color(0xFF4C748B),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Recommended",
                          key: Key('recommended'),
                          style: TextStyle(
                            fontFamily: "Kollektif",
                            fontSize: 18,
                            color: Color(0xFF4C748B),
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFF4C748B),
                        indent: 20.0,
                        endIndent: 20.0,
                        height: 0,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              widget.session.coffeeAmountNeeded().round().toString() + "g - " + widget.session.coffeeGroundType(),
                              key: Key('coffee-grounds'),
                              style: TextStyle(
                                fontFamily: "Kollektif",
                                fontSize: 14,
                                color: Color(0xFF4C748B),
                              ),
                            ),
                            Text(
                              widget.session.waterNeeded().round().toString() + "g - water",
                              key: Key('water-amount'),
                              style: TextStyle(
                                fontFamily: "Kollektif",
                                fontSize: 14,
                                color: Color(0xFF4C748B),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Enjoy your delicious coffee.',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontStyle: FontStyle.italic,
                            fontSize: 10,
                            color: Color(0xFF4C748B),
                          ),
                        ),
                      )
                    ]
                  )
                ),
                Spacer(),
                SizedBox(
                  width: 315,
                  height: 56,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      child: Text(
                        "Done",
                        key: Key("done-btn"),
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          letterSpacing: 1.0,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        backgroundColor: Color(0xFF4C748B),
                      ),
                      onPressed: () {
                          widget.session.clearValues();
                          Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ChooseDeviceScreen(widget.session)));
                      },
                    )
                  ),
                )
              ]
            )
          )
        ),
      ),
    );
  }
}