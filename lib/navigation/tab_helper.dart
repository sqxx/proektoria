import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:proektoria/navigation/page.dart';
import 'package:proektoria/navigation/tab.dart';
import 'package:proektoria/pages/home_page.dart';
import 'package:proektoria/pages/notes_page.dart';
import 'package:proektoria/pages/proektoria_page.dart';
import 'package:proektoria/pages/schedule_page.dart';

class NavigationTabHelper {
  static final List<NavigationTab> tabs = [
    NavigationTab(
        OMIcons.home, 'Главная', Colors.green, NavigationPage(HomePage())),
    NavigationTab(OMIcons.event, 'Расписание', Colors.orange,
        NavigationPage(SchedulePage())),
    NavigationTab(OMIcons.notes, 'Заметки', Colors.redAccent,
        NavigationPage(NotesPage())),
    NavigationTab(OMIcons.info, 'ПроеКТОриЯ', Colors.blueAccent,
        NavigationPage(ProektoriaPage()))
  ];
}
