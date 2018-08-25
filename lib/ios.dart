import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

class IOSPage extends StatefulWidget {
  IOSPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IOSPageState createState() => new _IOSPageState();
}

class _IOSPageState extends State<IOSPage> {
int _selectedColorIndex = 0;

  int _selectedHour = 0;
  int _selectedMinute = 0;

 List<String> coolColorNames = <String>[
  'Sarcoline', 'Coquelicot', 'Smaragdine', 'Mikado', 'Glaucous', 'Wenge',
  'Fulvous', 'Xanadu', 'Falu', 'Eburnean', 'Amaranth', 'Australien',
  'Banan', 'Falu', 'Gingerline', 'Incarnadine', 'Labrador', 'Nattier',
  'Pervenche', 'Sinoper', 'Verditer', 'Watchet', 'Zaffre',
];



  Widget _IOSBody(BuildContext context, int index) {
    return 
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
        child: Container(
            height: 1024.0,
            child: 
            
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                Center(
                  child: new CupertinoButton(
                    child: const Text('Next page'),
                    onPressed: () {
                      Navigator.of(context).push(
                        new CupertinoPageRoute<Null>(
                          builder: (BuildContext context) {
                            return new CupertinoPageScaffold(
                              navigationBar: new CupertinoNavigationBar(
                                middle: new Text('Page 2 of tab $index'),
                              ),
                              child: new Center(
                                child: new CupertinoButton(
                                  child: const Text('Back'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
               Padding(
                    padding: EdgeInsets.only(left:25.0, right:25.0),
                    child:RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'This is a sample of iOS/San Francisco text with ',
                    style: iOSTheme().textTheme.body1
                        .copyWith(fontSize: 18.0, fontFamily: 'SF'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'bold',
                          style: new TextStyle(fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: ' and italic!',
                          style: new TextStyle(fontStyle: FontStyle.italic)),
                    ],
                  ),
                )),
                CupertinoActivityIndicator(radius: 20.0,),
                CupertinoSwitch(
                  onChanged: (bool value) {},
                  value: true,
                ),
                Icon(CupertinoIcons.share),
                CupertinoSlider(
                  onChanged: (double value) {},
                  value: 10.0,
                  min: 0.0,
                  max: 30.0,
                ),
                new CupertinoButton(
                    child: const Text('Dialog'),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _createCupertinoAlertDialog();
                          });
                    }),
                new CupertinoButton(
                                  color: CupertinoColors.activeBlue,

                    child: const Text('Pick a Date'),
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: false,
                        locale: 'us',
                        minYear: 1970,
                        maxYear: 2020,
                        initialYear: 2018,
                        initialMonth: 6,
                        initialDate: 21,
                        onChanged: (year, month, date) {},
                        onConfirm: (year, month, date) {},
                      );
                    }),
                    new CupertinoButton(
                    child: const Text('Picker'),
                    onPressed: () async {
                      await showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildBottomPicker(_buildColorPicker());
                    },
                  );
                    }),
              ],
            ))
            );
  }


  CupertinoAlertDialog _createCupertinoAlertDialog() =>
      new CupertinoAlertDialog(
        title: new Text('This is an iOS Dialog'),
        content: new Text('Do you really want to do that?'),
        actions: <Widget>[
          new CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('Cancel'),
          ),
          new CupertinoButton(
              onPressed: () {
                setState(() {
                  // _counter = 0;
                });
                Navigator.pop(context);
              },
              child: new Text('OK')),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Theme(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("iOS Style"),
        trailing:  ExitButton(),
      ),
      child:Padding( 
        padding: EdgeInsets.only(top:40.0),
        child:  _IOSBody(context, 0)),
      
    ), data: iOSTheme().copyWith(
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'SF')),
    );
  }



  ThemeData iOSTheme() {
    return ThemeData(
        primarySwatch: Colors.blue,
        textSelectionColor: Colors.red
      );
  }

  Widget _buildBottomPicker(Widget picker) {
    return new Container(
      height: _kPickerSheetHeight,
      color: CupertinoColors.white,
      child: new DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: new GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: new SafeArea(
            child: picker,
          ),
        ),
      ),
    );
  }

 Widget _buildColorPicker() {
    final FixedExtentScrollController scrollController =
      new FixedExtentScrollController(initialItem: _selectedColorIndex);
    return new CupertinoPicker(
      scrollController: scrollController,
      itemExtent: _kPickerItemHeight,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (int index) {
        setState(() {
          _selectedColorIndex = index;
        });
      },
      children: new List<Widget>.generate(coolColorNames.length, (int index) {
        return new Center(child:
        new Text(coolColorNames[index]),
        );
      }),
    );
  }


}

class ExitButton extends StatelessWidget {
  const ExitButton();

  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Tooltip(
        message: 'Back',
        child: Icon(CupertinoIcons.info),
        excludeFromSemantics: true,
      ),
      onPressed: () {
        // The demo is on the root navigator.
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
  }
}
