import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proektoria/main.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));

    return MaterialApp(
        title: 'ПроеКТОриЯ', debugShowCheckedModeBanner: false, home: Main());
  }
}
