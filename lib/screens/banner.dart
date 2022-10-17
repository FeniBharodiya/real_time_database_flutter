import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialBannerClass extends StatefulWidget {
  MaterialBannerClass({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MaterialBannerClassState createState() => _MaterialBannerClassState();
}

class _MaterialBannerClassState extends State<MaterialBannerClass> {
  MaterialBanner _showMaterialBanner(BuildContext context) {
    return MaterialBanner(
        content: Text('Hello, I am a Material Banner'),
        leading: Icon(Icons.location_history_rounded),
        padding: EdgeInsets.all(15),
        backgroundColor: Color.fromARGB(255, 175, 218, 233),
        contentTextStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Agree',
              style: TextStyle(color: Colors.purple),
            ),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ' pushed the button to see MaterialBanner:',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showMaterialBanner(_showMaterialBanner(context));
              },
              child: Text(
                'Click Here',
                style: TextStyle(color: Colors.purple),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 84, 129, 153),
              ),
            ),
          ],
        ),
      ), 
    );
  }
}
