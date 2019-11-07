import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/forum_direction.dart';
import 'package:proektoria/data/forum_event.dart';
import 'package:proektoria/ui/styles/AppColors.dart';

class ForumData {
  static final today = DateTime.now();

  static final directions = <ForumDirection>[
    ForumDirection(
      'Технологии Материалов',
      AppColors.MATERIALS_CLUSTER,
      DirectionType.MATERIALS,
    ),
    ForumDirection(
      'Технологии Движения',
      AppColors.MOVEMENT_CLUSTER,
      DirectionType.MOVEMENT,
    ),
    ForumDirection(
      'Космические Технологии',
      AppColors.SPACE_CLUSTER,
      DirectionType.SPACE,
    ),
    ForumDirection(
      'Технологии Энергии',
      AppColors.ENERGY_CLUSTER,
      DirectionType.ENERGY,
    ),
    ForumDirection(
      'IT Технологии',
      AppColors.IT_CLUSTER,
      DirectionType.IT,
    ),
    ForumDirection(
      'Технологии Здоровья',
      AppColors.HEALTH_CLUSTER,
      DirectionType.HEALTH,
    ),
  ];

  static final schedule = <List<ForumEvent>>[
    // 10 Декабря
    [
      ForumEvent(
        name: "Заезд и размещение участников Форума. Регистрация",
        type: DirectionType.NONE,
        venue: "Гостиницы",
        start: DateTime(2018, 12, 10, 11, 00),
        end: DateTime(2018, 12, 10, 20, 00),
      ),
      ForumEvent(
        name: "Ужин",
        type: DirectionType.NONE,
        venue: "Гостиницы",
        start: DateTime(2018, 12, 10, 19, 00),
        end: DateTime(2018, 12, 10, 21, 00),
      ),
      ForumEvent(
        name: "Ознакомительная встреча школьников с кураторами",
        type: DirectionType.NONE,
        venue: "Гостиницы",
        start: DateTime(2018, 12, 10, 21, 00),
        end: DateTime(2018, 12, 10, 22, 30),
      ),
    ],
    // 11 декабря
    [
      ForumEvent(
        name: "Завтрак",
        type: DirectionType.NONE,
        venue: "Гостиницы",
        start: DateTime(2018, 12, 11, 7, 00),
        end: DateTime(2018, 12, 11, 8, 00),
      ),
      ForumEvent(
        name: "Трансфер из гостиниц в «Арену»",
        type: DirectionType.NONE,
        start: DateTime(2018, 12, 11, 8, 15),
        end: DateTime(2018, 12, 11, 8, 45),
      ),
      ForumEvent(
        name: "Знакомство по тематическим направлениям",
        type: DirectionType.NONE,
        venue: "Арена. Классы",
        start: DateTime(2018, 12, 11, 9, 00),
        end: DateTime(2018, 12, 11, 9, 30),
      ),
      ForumEvent(
        name: "Торжественное открытие деловой образовательной программы",
        type: DirectionType.NONE,
        venue: "Арена. Главный зал",
        start: DateTime(2018, 12, 11, 10, 00),
        end: DateTime(2018, 12, 11, 10, 15),
      ),
      ForumEvent(
        name:
        "1 бинарный урок от победителя Всероссийского конкурса «Авторские уроки будущего» с отраслевым работодателем",
        type: DirectionType.NONE,
        venue: "Арена. Главный зал",
        start: DateTime(2018, 12, 11, 10, 15),
        end: DateTime(2018, 12, 11, 10, 30),
      ),
      ForumEvent(
        name:
        "2 бинарный урок от победителя Всероссийского конкурса «Авторские уроки будущего» с отраслевым работодателем",
        type: DirectionType.NONE,
        venue: "Арена. Главный зал",
        start: DateTime(2018, 12, 11, 10, 30),
        end: DateTime(2018, 12, 11, 10, 45),
      ),
      ForumEvent(
        name:
        "3 бинарный урок от победителя Всероссийского конкурса «Авторские уроки будущего» с отраслевым работодателем",
        type: DirectionType.NONE,
        venue: "Арена. Главный зал",
        start: DateTime(2018, 12, 11, 10, 45),
        end: DateTime(2018, 12, 11, 11, 00),
      ),
      ForumEvent(
        name:
        "4 бинарный урок от победителя Всероссийского конкурса «Авторские уроки будущего» с отраслевым работодателем",
        type: DirectionType.NONE,
        venue: "Арена. Главный зал",
        start: DateTime(2018, 12, 11, 11, 00),
        end: DateTime(2018, 12, 11, 11, 15),
      ),
      ForumEvent(
        name:
        "5 бинарный урок от победителя Всероссийского конкурса «Авторские уроки будущего» с отраслевым работодателем",
        type: DirectionType.NONE,
        venue: "Арена. Главный зал",
        start: DateTime(2018, 12, 11, 11, 15),
        end: DateTime(2018, 12, 11, 11, 30),
      ),
      ForumEvent(
        name:
        "6 бинарный урок от победителя Всероссийского конкурса «Авторские уроки будущего» с отраслевым работодателем",
        type: DirectionType.NONE,
        venue: "Арена. Главный зал",
        start: DateTime(2018, 12, 11, 11, 30),
        end: DateTime(2018, 12, 11, 11, 45),
      ),
      ForumEvent(
        name: "Обед",
        type: DirectionType.NONE,
        venue: "Ресторан «Волга-Волга»",
        start: DateTime(2018, 12, 11, 11, 45),
        end: DateTime(2018, 12, 11, 13, 45),
      ),
      ForumEvent(
        name: "Космические технологии",
        type: DirectionType.SPACE,
        venue: "Арена. Классы",
        start: DateTime(2018, 12, 11, 13, 45),
        end: DateTime(2018, 12, 11, 16, 30),
      ),
      ForumEvent(
        name: "Технологии энергии",
        type: DirectionType.ENERGY,
        venue: "Арена. Классы",
        start: DateTime(2018, 12, 11, 13, 45),
        end: DateTime(2018, 12, 11, 16, 30),
      ),
      ForumEvent(
        name: "Технологии движения",
        type: DirectionType.MOVEMENT,
        venue: "Арена. Классы",
        start: DateTime(2018, 12, 11, 13, 45),
        end: DateTime(2018, 12, 11, 16, 30),
      ),
      ForumEvent(
        name: "Информационные технологии",
        type: DirectionType.IT,
        venue: "Арена. Классы",
        start: DateTime(2018, 12, 11, 13, 45),
        end: DateTime(2018, 12, 11, 16, 30),
      ),
      ForumEvent(
        name: "Технологии материалов",
        type: DirectionType.MATERIALS,
        venue: "Арена. Классы",
        start: DateTime(2018, 12, 11, 13, 45),
        end: DateTime(2018, 12, 11, 16, 30),
      ),
      ForumEvent(
        name: "Технологии здоровья",
        type: DirectionType.HEALTH,
        venue: "Арена. Классы",
        start: DateTime(2018, 12, 11, 13, 45),
        end: DateTime(2018, 12, 11, 16, 30),
      ),
    ]
  ];

  static ForumDirection getForumDirectionByType(DirectionType type) {
    if (type == DirectionType.NONE) return null;

    ForumDirection fDirection;

    directions.forEach((_) => {if (_.directionType == type) fDirection = _});

    if (fDirection == null) {
      throw Exception(
          "Даный тип не представлен на форуме: " + type.index.toString());
    } else {
      return fDirection;
    }
  }
}
