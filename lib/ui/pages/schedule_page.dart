import 'package:flutter/material.dart';
import 'package:proektoria/navigation/tab_helper.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SchedulePageState();
  }
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(NavigationTabHelper.tabs[1].description));
  }
}
