import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:proektoria/data/Profile.dart';
import 'package:proektoria/ui/screens/DirectionSelectorScreen.dart';
import 'package:proektoria/ui/screens/MainScreen.dart';
import 'package:proektoria/ui/screens/NoForumScreen.dart';
import 'package:proektoria/ui/screens/StudentDirectionSelectorScreen.dart';

import 'navigation/NavigationData.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _dirSelectorScreen = DirectionSelectorScreen();
  final _studentDirSelectorScreen = StudentDirectionSelectorScreen();
  final _mainScreen = MainScreen();
  final _waitForumScreen = NoForumScreen();

  bool _isProfileSaved;

  /// Проверяет, был ли создан профиль ранее
  bool _isProfileAvailable() =>
      _isProfileSaved != null && _isProfileSaved == true;

  /// Загружает настройки профиля и вызывает обновление
  void _loadPreferences() async {
    _isProfileSaved = await Profile.isProfileSaved();
    setState(() {});
  }

  void _initializeNavigation() => NavigationData.rebuildTabs();

  @override
  void initState() {
    super.initState();

    _loadPreferences();
    _initializeNavigation();

    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'CeraPro',
      ),
      home: _isProfileAvailable()
          ? _mainScreen
          : _dirSelectorScreen,
      routes: {
        '/direction_selector': (_) => _dirSelectorScreen,
        '/student_direction_selector': (_) => _studentDirSelectorScreen,
        '/main': (_) => _mainScreen,
        '/wait_forum': (_) => _waitForumScreen
      },
    );
  }
}
