import 'package:flutter/material.dart';
import 'ios.dart';
import 'android.dart';
import 'win95.dart';

class UiPsychRoutes {
  static final home = "/";
  static final iOSSample = "/ios";
  static final androidSample = "/android";
  static final win95Sample = "/win95";
}

class UiPsychKeys {
  static final homeScreen = const Key('__homeScreen__');
  static final iOSSampleScreen = const Key('__iOSSampleScreen__');
  static final androidSampleScreen = const Key('__androidSampleScreen__');
  static final win95SampleScreen = const Key('__win95creen__');
}

enum TransitionType {
  native,
  nativeModal,
  inFromLeft,
  inFromRight,
  inFromBottom,
  fadeIn,
  custom, // if using custom then you must also provide a transition
}

Widget _standardTransitionsBuilder(
    TransitionType transitionType, Animation<double> animation, Widget child) {
  if (transitionType == TransitionType.fadeIn) {
    return new FadeTransition(opacity: animation, child: child);
  } else {
    const Offset topLeft = const Offset(0.0, 0.0);
    const Offset topRight = const Offset(1.0, 0.0);
    const Offset bottomLeft = const Offset(0.0, 1.0);
    Offset startOffset = bottomLeft;
    Offset endOffset = topLeft;
    if (transitionType == TransitionType.inFromLeft) {
      startOffset = const Offset(-1.0, 0.0);
      endOffset = topLeft;
    } else if (transitionType == TransitionType.inFromRight) {
      startOffset = topRight;
      endOffset = topLeft;
    }

    return new SlideTransition(
      position: new Tween<Offset>(
        begin: startOffset,
        end: endOffset,
      ).animate(animation),
      child: child,
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute(this.transitionType,
      {WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  final TransitionType transitionType;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;

    return _standardTransitionsBuilder(transitionType, animation, child);
  }
}

Route<dynamic> getRoute(RouteSettings settings) {
  final List<String> path = settings.name.split('/');
  debugPrint('## settingsName: ${settings.name}');
  debugPrint('## Path: $path');

  if (path[0] != '') {
    debugPrint('## path[0] not null: ${path[0]}');
    return null;
  }

  //final root = path[1];

  String param;
  if (path.length > 2) {
    param = path[2];
  }

  if (settings.name.startsWith(UiPsychRoutes.iOSSample)) {
    return new MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => IOSPage(
            key: UiPsychKeys.iOSSampleScreen,
          ),
    );
  }

  if (settings.name.startsWith(UiPsychRoutes.androidSample)) {
    return new MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => AndroidPage(
            key: UiPsychKeys.androidSampleScreen,
          ),
    );
  }

   if (settings.name.startsWith(UiPsychRoutes.win95Sample)) {
    return new MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => Win95Page(
            key: UiPsychKeys.win95SampleScreen,
          ),
    );
  }

  debugPrint("### Failed All Routes: ${settings.toString()}");

  return null;
}
