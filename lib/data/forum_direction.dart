import 'package:flutter/material.dart';
import 'package:proektoria/data/direction_type.dart';

class ForumDirection {
  String name;
  Color primaryColor;
  DirectionType directionType;
  String logoPath;

  ForumDirection(this.name,
      this.primaryColor,
      this.directionType, {
        this.logoPath = "",
      });
}
