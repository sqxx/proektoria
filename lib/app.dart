import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proektoria/ui/screens/direction_selector_screen.dart';
import 'package:proektoria/ui/screens/main_screen.dart';
import 'package:proektoria/ui/screens/student_direction_selector_screen.dart';

import 'data/colors.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.GENTLE_WHITE,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'ПроеКТОриЯ',
      debugShowCheckedModeBanner: false,
      home: DirectionSelectorScreen(),
      routes: {
        '/direction_selector': (context) => DirectionSelectorScreen(),
        '/student_direction_selector': (context) =>
            StudentDirectionSelectorScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
