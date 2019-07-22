import 'package:proektoria/data/colors.dart';
import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/forum_direction.dart';
import 'package:proektoria/data/forum_event.dart';

class ForumData {
  static final directions = <ForumDirection>[
    ForumDirection('Технологии Материалов', AppColors.MATERIALS_CLUSTER,
        DirectionType.MATERIALS),
    ForumDirection('Технологии Движения', AppColors.MOVEMENT_CLUSTER,
        DirectionType.MOVEMENT),
    ForumDirection(
        'Космические Технологии', AppColors.SPACE_CLUSTER, DirectionType.SPACE),
    ForumDirection(
        'Технологии Энергии', AppColors.ENERGY_CLUSTER, DirectionType.ENERGY),
    ForumDirection('IT Технологии', AppColors.IT_CLUSTER, DirectionType.IT),
    ForumDirection(
        'Технологии Здоровья', AppColors.HEALTH_CLUSTER, DirectionType.HEALTH),
  ];

  static final schedule = <List<ForumEvent>>[
    // 10 Декабря
    [
      ForumEvent(
        name: "Заезд и размещение участников Форума. Регистрация",
        type: DirectionType.NONE,
        venue: "Гостиницы",
        start: DateTime(2019, 12, 10, 11, 00),
        end: DateTime(2019, 12, 10, 20, 00),
      ),
      ForumEvent(
        name: "Ужин",
        type: DirectionType.NONE,
        venue: "Гостиницы",
        start: DateTime(2019, 12, 10, 19, 00),
        end: DateTime(2019, 12, 10, 21, 00),
      ),
      ForumEvent(
        name: "Ознакомительная встреча школьников с кураторами",
        type: DirectionType.NONE,
        venue: "Гостиницы",
        start: DateTime(2019, 12, 10, 21, 00),
        end: DateTime(2019, 12, 10, 22, 30),
      ),
    ],
  ];
}
