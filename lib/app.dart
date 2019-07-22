import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:proektoria/data/colors.dart';
import 'package:proektoria/data/profile.dart';
import 'package:proektoria/ui/screens/direction_selector_screen.dart';
import 'package:proektoria/ui/screens/main_screen.dart';
import 'package:proektoria/ui/screens/student_direction_selector_screen.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isProfileSaved;

  bool _isProfileAvailable() =>
      _isProfileSaved != null && _isProfileSaved == true;

  void _loadPreferences() async {
    _isProfileSaved = await Profile.isProfileSaved();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();

    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
        _isProfileAvailable() ? Colors.white : AppColors.GENTLE_WHITE,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'ПроеКТОриЯ',
      debugShowCheckedModeBanner: false,
      home: _isProfileAvailable() ? MainScreen() : DirectionSelectorScreen(),
      routes: {
        '/direction_selector': (context) => DirectionSelectorScreen(),
        '/student_direction_selector': (context) =>
            StudentDirectionSelectorScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
