import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'android.dart';
import 'ios.dart';
import 'win95.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Different UIs"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              image: new AssetImage('assets/android.png'),
              height: 120.0,
            ),
            RaisedButton(
                child: Text("Android Demo",
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w800)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AndroidPage()),
                  );
                }),
            Image(
              image: new AssetImage('assets/ios.png'),
              height: 80.0,
            ),
            CupertinoButton(
                color: CupertinoColors.activeBlue,
                child: Text("iOS Demo",
                    style: TextStyle(
                        fontFamily: 'SF', fontWeight: FontWeight.w800)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IOSPage()),
                  );
                }),
                RaisedButton(
                child: Text("Win95 Demo (Filip Hracek)",
                    style: TextStyle(fontSize: 18.0,
                        fontFamily: 'RedAlert', fontWeight: FontWeight.w800)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Win95Page()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
