import 'package:flutter/foundation.dart';
import 'package:proektoria/data/direction_type.dart';

class ForumEvent {
  String name;
  String description;
  DirectionType type;
  String venue;
  DateTime start;
  DateTime end;

  ForumEvent({
    @required this.name,
    @required this.type,
    @required this.start,
    @required this.end,
    this.description,
    this.venue,
  });
}
