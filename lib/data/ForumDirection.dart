import 'package:flutter/material.dart';
import 'package:proektoria/data/DirectionType.dart';

class ForumDirection {
  /// Название направления
  String name;

  /// Иконка направления
  String pathToIcon;

  /// Акцентный цвет направления
  Color primaryColor;

  /// Тип направления
  DirectionType directionType;

  ForumDirection({
    @required this.name,
    @required this.pathToIcon,
    @required this.primaryColor,
    @required this.directionType,
  }) {
    assert(name != null);
    assert(pathToIcon != null);
    assert(primaryColor != null);
    assert(directionType != null);
  }
}
