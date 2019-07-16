import 'package:flutter/material.dart';

class BeautifulNavigationItem {
  final Icon icon;
  final Text title;

  BeautifulNavigationItem({@required this.icon, @required this.title}) {
    assert(icon != null);
    assert(title != null);
  }
}
