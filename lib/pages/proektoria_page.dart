import 'package:flutter/material.dart';
import 'package:proektoria/navigation/tab_helper.dart';

class ProektoriaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProektoriaPageState();
  }
}

class _ProektoriaPageState extends State<ProektoriaPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(NavigationTabHelper.tabs[3].description));
  }
}
