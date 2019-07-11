import 'package:flutter/material.dart';
import 'package:proektoria/navigation/tab_helper.dart';

class NotesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotesPageState();
  }
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(NavigationTabHelper.tabs[2].description));
  }
}
