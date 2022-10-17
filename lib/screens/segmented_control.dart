import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_time_database/screens/home_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? groupValue = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          
          title: Text(
            "Segmented Control Demo",
            style: TextStyle(fontSize: 19),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: CupertinoSlidingSegmentedControl<int>(
            backgroundColor: CupertinoColors.white,
            thumbColor: CupertinoColors.activeGreen,
            padding: EdgeInsets.all(8),
            groupValue: groupValue,
            children: {
              0: buildSegment("Flutter"),
              1: buildSegment("React"),
              2: buildSegment("Native"),
            },
            onValueChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          
        ),
    
      );

  Widget buildSegment(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
    );
  }
}
