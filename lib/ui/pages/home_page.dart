import 'package:flutter/material.dart';
import 'package:proektoria/navigation/tab_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(NavigationTabHelper.tabs[0].description),
    );
  }
}
