import 'package:flutter/material.dart';

class AndroidPage extends StatefulWidget {
  AndroidPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AndroidPageState createState() => new _AndroidPageState();
}

class _AndroidPageState extends State<AndroidPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Android Demo"),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {},
            ),
            // action button
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {},
            ),
            // overflow menu
            PopupMenuButton<String>(
              onSelected: (s) {},
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    const PopupMenuItem<String>(
                        value: 'Toolbar menu', child: Text('Toolbar menu')),
                    const PopupMenuItem<String>(
                        value: 'Menu 2', child: Text('Menu 2')),
                    const PopupMenuItem<String>(
                        value: 'Yet Another', child: Text('Yet Another')),
                  ],
            ),
          ],
        ),
        body: new _AndroidBody(),
      ),
      data: Theme.of(context).copyWith(
          primaryColor: Colors.green,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto')),
    );
  }
}

class _AndroidBody extends StatelessWidget {
  _AndroidBody({
    Key key,
  }) : super(key: key);

  final List<String> coolColorNames = <String>[
    'Sarcoline',
    'Coquelicot',
    'Smaragdine',
    'Mikado',
    'Glaucous',
    'Wenge',
    'Fulvous',
    'Xanadu',
    'Falu',
    'Eburnean',
    'Amaranth',
    'Australien',
    'Banan',
    'Falu',
    'Gingerline',
    'Incarnadine',
    'Labrador',
    'Nattier',
    'Pervenche',
    'Sinoper',
    'Verditer',
    'Watchet',
    'Zaffre',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
            height: 1024.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'This is a sample of Android/Roboto text with ',
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(fontSize: 18.0),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'bold',
                                style:
                                    new TextStyle(fontWeight: FontWeight.w800)),
                            TextSpan(
                                text: ' and italic!',
                                style:
                                    new TextStyle(fontStyle: FontStyle.italic)),
                          ],
                        ),
                      )),
                  // Center(
                  //     child: MaterialButton(
                  //   child: Text('Next page'),
                  //   onPressed: () {},
                  // )),
                  CircularProgressIndicator(),
                  Switch(
                    onChanged: (bool value) {},
                    value: false,
                  ),
                  Icon(Icons.share),
                  Slider(
                    onChanged: (double value) {},
                    value: 10.0,
                    min: 0.0,
                    max: 30.0,
                  ),
                  RaisedButton(
                      child: const Text('Dialog'),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _createAndroidAlertDialog(context);
                            });
                      }),
                  RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: const Text(
                        'Pick a Date',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime.now()
                              .subtract(new Duration(days: 30)),
                          lastDate:
                              new DateTime.now().add(new Duration(days: 30)),
                        );
                      }),

                  PopupMenuButton<String>(
                      child: Text('Picker'),
                      onSelected: (s) {},
                      itemBuilder: (BuildContext context) =>
                          coolColorNames.map((c) {
                            return PopupMenuItem<String>(
                                value: c, child: Text(c));
                          }).toList()

                      // <PopupMenuItem<String>>[
                      //       const PopupMenuItem<String>(
                      //           value: 'Toolbar menu', child: Text('Toolbar menu')),
                      //       const PopupMenuItem<String>(
                      //           value: 'Menu 2', child: Text('Menu 2')),
                      //       const PopupMenuItem<String>(
                      //           value: 'Yet Another', child: Text('Yet Another')),
                      //     ],
                      )
                ])));
  }

  AlertDialog _createAndroidAlertDialog(BuildContext context) =>
      new AlertDialog(
        title: new Text('This is an Android Dialog'),
        content: new Text('Do you really want to do that?'),
        actions: <Widget>[
          new MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('Cancel'),
          ),
          new MaterialButton(
              onPressed: () {
                // setState(() {
                //   // _counter = 0;
                // });
                Navigator.pop(context);
              },
              child: new Text('OK')),
        ],
      );
}
