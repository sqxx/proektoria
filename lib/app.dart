import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proektoria/ui/screens/main_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xfff2f3f8),
        systemNavigationBarIconBrightness: Brightness.dark));

    return MaterialApp(
        title: 'ПроеКТОриЯ',
        debugShowCheckedModeBanner: false,
        home: MainScreen() /*DirectionSelector()*/);
  }
}
