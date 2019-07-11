import 'package:flutter/material.dart';
import 'package:proektoria/navigation/tab_helper.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(NavigationTabHelper.tabs[3].description));
  }
}
