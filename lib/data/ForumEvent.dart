import 'package:flutter/foundation.dart';
import 'package:proektoria/data/DirectionType.dart';
import 'package:proektoria/data/ForumEventType.dart';

class ForumEvent {
  /// Название события
  String name;

  /// Описание события
  String description;

  /// Направление события
  DirectionType type;

  /// Место проведения события
  String venue;

  /// Время начала события
  DateTime start;

  /// Время окончания события
  DateTime end;

  /// Тип мероприятия
  ForumEventType eventType;

  ForumEvent({
    @required this.name,
    this.description,
    this.type = DirectionType.NONE,
    this.venue,
    @required this.start,
    this.end,
    this.eventType = ForumEventType.NONE,
  }) {
    assert(name != null);
    assert(type != null);
    assert(start != null);
    assert(eventType != null);
  }
}
