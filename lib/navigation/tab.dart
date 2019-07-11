import 'package:flutter/material.dart';
import 'package:proektoria/navigation/page.dart';

class NavigationTab {
  IconData icon;
  String description;
  Color color;
  NavigationPage page;

  NavigationTab(this.icon, this.description, this.color, this.page);
}
