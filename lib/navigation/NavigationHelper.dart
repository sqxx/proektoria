import 'package:flutter/material.dart';

class NavigationHelper {
  /// Перемещает на экран и полностью отчищает стек навигации
  static void finalNamedNavigation(BuildContext context, String name) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      name,
      (_) => false,
    );
  }
}
