import 'package:flutter/material.dart';

class BeautifulNavigationItem {
  final Icon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;

  BeautifulNavigationItem(
      {@required this.icon,
      @required this.title,
      this.activeColor = Colors.blue,
      this.inactiveColor}) {
    assert(icon != null);
    assert(title != null);
  }
}
