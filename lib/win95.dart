import 'package:flutter/material.dart';

class Win95Page extends StatefulWidget {
  Win95Page({Key key}) : super(key: key);

  @override
  _Win95PageState createState() => new _Win95PageState();
}

class Win95Button extends StatefulWidget {
  final String text;

  final double minWidth;

  final double margin;

  final VoidCallback onTap;

  Win95Button({
    Key key,
    @required this.text,
    this.minWidth: 60.0,
    this.margin: 4.0,
    this.onTap,
  }) : super(key: key);

  @override
  _Win95ButtonState createState() => _Win95ButtonState();
}

class _Win95PageState extends State<Win95Page> {
  static final _winFontStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'RedAlert',
    fontSize: 18.0,
  );

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFFbfb8bf),
      appBar: new AppBar(
        leading: Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              color: const Color(0xFFbfb8bf),
              padding: EdgeInsets.all(0.0),
              child: Icon(Icons.clear),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: const Color(0xFF000080),
        title: new Text(
          "Windows 95 Demo",
          style: _winFontStyle.copyWith(
              fontSize: 24.0, color: const Color(0xFFF7F7F7)),
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
              style: _winFontStyle,
            ),
            new Text(
              '$_counter',
              style: _winFontStyle.copyWith(fontSize: 54.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Win95Button(text: "Increment", onTap: _incrementCounter),
                Win95Button(text: "Decrement", onTap: _decrementCounter),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}

class _Win95ButtonState extends State<Win95Button> {
  static const _backgroundColor = const Color(0xFFbfb8bf);

  static const _borderWidth = 1.0;
  static const _whiteSide =
      const BorderSide(color: Color(0xFFFFF8FF), width: _borderWidth);
  static const _lightGraySide =
      const BorderSide(color: Color(0xFFdfd8df), width: _borderWidth);
  static const _darkGraySide =
      const BorderSide(color: Color(0xFF7f787f), width: _borderWidth);
  static const _blackSide =
      const BorderSide(color: Colors.black, width: _borderWidth);

  static const _outerDecoration = BoxDecoration(
    border: Border(
        top: _whiteSide,
        left: _whiteSide,
        right: _blackSide,
        bottom: _blackSide),
  );

  static const _outerDecorationPressed = BoxDecoration(
    border: Border(
        top: _blackSide,
        left: _blackSide,
        right: _whiteSide,
        bottom: _whiteSide),
  );

  static const _innerDecoration = BoxDecoration(
    color: _backgroundColor,
    border: Border(
        top: _lightGraySide,
        left: _lightGraySide,
        right: _darkGraySide,
        bottom: _darkGraySide),
  );

  static const _innerDecorationPressed = BoxDecoration(
    color: _backgroundColor,
    border: Border(
        top: _darkGraySide,
        left: _darkGraySide,
        right: _lightGraySide,
        bottom: _lightGraySide),
  );

  bool _pressed = false;

  bool get isDisabled => widget.onTap == null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.margin),
      child: Container(
        decoration: _pressed ? _outerDecorationPressed : _outerDecoration,
        child: Container(
          decoration: _pressed ? _innerDecorationPressed : _innerDecoration,
          child: GestureDetector(
            onTapDown: isDisabled ? null : _onTapDown,
            onTapCancel: isDisabled ? null : _onTapCancel,
            onTapUp: isDisabled ? null : _onTapUp,
            child: _buildContents(),
          ),
        ),
      ),
    );
  }

  Padding _buildContents() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: widget.minWidth),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontFamily: 'RedAlert',
          ),
        ),
      ),
    );
  }

  void _onTapCancel() {
    setState(() {
      _pressed = false;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _pressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _pressed = false;
    });

    widget.onTap();
  }
}
