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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("HOMEBREW"), Text("Great Coffee at Home")],
        ),
      ),
    );
  }
}
