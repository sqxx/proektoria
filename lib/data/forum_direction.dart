import 'package:flutter/material.dart';
import 'package:proektoria/data/direction_type.dart';

class ForumDirection {
  String name;
  String logoPath;
  Color primaryColor;
  DirectionType directionType;

  ForumDirection(this.name, this.primaryColor, this.directionType,
      {this.logoPath = ""});
}
