import 'package:flutter/material.dart';
import 'package:proektoria/data/DirectionType.dart';

class ForumDirection {
  /// Название направления
  String name;

  /// Иконка направления
  IconData icon;

  /// Путь к иллюстрации
  String illustrationPath;

  /// Тип
  DirectionType directionType;

  ForumDirection({
    @required this.name,
    @required this.icon,
    @required this.illustrationPath,
    @required this.directionType,
  }) {
    assert(name != null);
    assert(icon != null);
    assert(illustrationPath != null);
    assert(directionType != null);
  }
}
