import 'package:flutter/material.dart';
import 'package:proektoria/navigation/NavigationPage.dart';

class NavigationTab {
  /// Название вкладки
  String name;

  /// Иконка вкладки
  IconData icon;

  /// Содержимое страницы
  NavigationPage page;

  NavigationTab({
    @required this.name,
    @required this.icon,
    @required this.page,
  });
}
