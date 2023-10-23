import 'package:flutter/material.dart';
import 'package:homebrew/utils/coffee_tools.dart';
import 'dart:async';
import 'choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  CoffeeTools session;
  SplashScreen(this.session);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
       context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen(widget.session)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF4C748B),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Text(
                    "HOMEBREW",
                    style: TextStyle(
                      fontFamily: 'Norwester',
                      fontSize: 48,
                      letterSpacing: 4,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.black
                    ),
                    ),
                    Text(
                      "HOMEBREW",
                      style: TextStyle(
                        fontFamily: "Norwester",
                        fontSize: 48,
                        letterSpacing: 4,
                        color: Color(0xFFFFFFFF),
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 1.0,
                            offset: Offset(0.0, 3.0),
                          )
                        ],
                      )
                    ),
                ],
              ),
              Text(
                "Great Coffee at Home",
                style: TextStyle(
                  fontFamily: "Kollektif",
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
                )
              ],
          ),
        ),
      ),
    );
  }
}
