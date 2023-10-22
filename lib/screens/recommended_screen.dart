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
            Icons.arrow_back_ios
          ),
          onPressed: () {
            Navigator.pop(context);
          }
        )
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Text("Recommended", key: Key('recommended')),
                    Text('line'),
                    Text(
                      widget.session.coffeeAmountNeeded().round().toString() + "g - " + widget.session.coffeeGroundType(),
                      key: Key('coffee-grounds')),
                    Text(
                      widget.session.waterNeeded().round().toString() + "g - water",
                      key: Key('water-amount')),
                    Text('Enjoy your delicious coffee.')
                  ]
                )
              ),
              TextButton(
                key: Key('done-btn'),
                child: Text("Done"),
                onPressed: (){
                  widget.session.clearValues();
                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ChooseDeviceScreen(widget.session)));
                  }
              )
            ]
          )
        )
      ),
    );
  }
}