import 'package:proektoria/data/DirectionType.dart';
import 'package:proektoria/data/ForumDirection.dart';
import 'package:proektoria/data/ForumEvent.dart';
import 'package:proektoria/data/ForumEventType.dart';
import 'package:proektoria/ui/styles/AppColors.dart';

class ForumData {
  static var today = DateTime.now();

  static final directions = <ForumDirection>[
    ForumDirection(
      name: 'Экология',
      pathToIcon: 'assets/directions/ecology.svg',
      primaryColor: AppColors.DIR_ECOLOGY,
      directionType: DirectionType.ECOLOGY,
    ),
    ForumDirection(
      name: 'Безопасность',
      pathToIcon: 'assets/directions/security.svg',
      primaryColor: AppColors.DIR_SECURITY,
      directionType: DirectionType.SECURITY,
    ),
    ForumDirection(
      name: 'Здоровье',
      pathToIcon: 'assets/directions/health.svg',
      primaryColor: AppColors.DIR_HEALTH,
      directionType: DirectionType.HEALTH,
    ),
    ForumDirection(
      name: 'Среда обитания',
      pathToIcon: 'assets/directions/health.svg',
      primaryColor: AppColors.DIR_WORLD,
      directionType: DirectionType.WORLD,
    ),
    ForumDirection(
      name: 'Производственная революция',
      pathToIcon: 'assets/directions/industrial.svg',
      primaryColor: AppColors.DIR_INDUSTRIAL,
      directionType: DirectionType.INDUSTRIAL,
    ),
    ForumDirection(
      name: 'Культурный код',
      pathToIcon: 'assets/directions/culture.svg',
      primaryColor: AppColors.DIR_CULTURE,
      directionType: DirectionType.CULTURE,
    ),
  ];

  static ForumDirection getForumDirectionByType(DirectionType type) {
    if (type == DirectionType.NONE) return null;

    ForumDirection fDirection;

    directions.forEach((_) => {if (_.directionType == type) fDirection = _});

    if (fDirection == null) {
      throw Exception(
          'Даный тип не представлен на форуме: ' + type.index.toString());
    } else {
      return fDirection;
    }
  }

  static final schedule = <List<ForumEvent>>[
    // 22 ноября
    [
      ForumEvent(
        name: 'Заезд и размещение участников Форума. Регистрация',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 22, 11, 00),
        end: DateTime(2019, 11, 22, 20, 00),
      ),
      ForumEvent(
          name: 'Ужин',
          venue: 'Гостиницы',
          start: DateTime(2019, 11, 22, 19, 00),
          end: DateTime(2019, 11, 22, 21, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Ознакомительная встреча школьников с кураторами',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 22, 21, 00),
        end: DateTime(2019, 11, 22, 22, 30),
      ),
    ],

    // 23 ноября
    [
      ForumEvent(
        name: 'Завтрак',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 23, 8, 00),
        end: DateTime(2019, 11, 23, 9, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Трансфер из гостиниц в «Арену»',
        start: DateTime(2019, 11, 23, 9, 15),
        end: DateTime(2019, 11, 23, 10, 00),
      ),
      ForumEvent(
        name: 'Знакомство с направлением',
        venue: 'Арена. Классы',
        start: DateTime(2019, 11, 23, 10, 00),
        end: DateTime(2019, 11, 23, 11, 00),
      ),
      ForumEvent(
        name: 'Торжественное открытие образовательной программы форума',
        venue: 'Арена. Главный зал',
        start: DateTime(2019, 11, 23, 11, 00),
        end: DateTime(2019, 11, 23, 11, 15),
        eventType: ForumEventType.MAIN,
      ),
      ForumEvent(
        name: 'Открытая дискуссия «Кто я в современном мире»',
        venue: 'Арена. Главный зал',
        start: DateTime(2019, 11, 23, 11, 15),
        end: DateTime(2019, 11, 23, 12, 45),
        eventType: ForumEventType.MAIN,
      ),
      ForumEvent(
        name: 'Кофе-пауза',
        venue: 'Арена',
        start: DateTime(2019, 11, 23, 12, 45),
        end: DateTime(2019, 11, 23, 13, 05),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        type: DirectionType.CULTURE,
        name: '«Принятие решений в ситуации неопределенности»',
        description:
            'Усачев Юрий Владимирович, Летчик-космонавт Российской Федерации, Государственная корпорация по космической деятельности «Роскосмос»',
        venue: 'Арена. Синий класс',
        start: DateTime(2019, 11, 23, 13, 05),
        end: DateTime(2019, 11, 23, 14, 45),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.ECOLOGY,
        name: '«Вместе стать лучшими в раскрытии талантов каждого»',
        description:
            'Лукьянова Екатерина Владимировна, Директор Центра непрерывного развития инженерных компетенций, АНО «Корпоративная Академия Росатома»',
        venue: 'Арена. Голубой класс',
        start: DateTime(2019, 11, 23, 13, 05),
        end: DateTime(2019, 11, 23, 14, 45),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.HEALTH,
        name: '«Почему важно критически мыслить?»',
        description: 'Драй Роман Васильевич, Директор R&D центра, ГЕРОФАРМ',
        venue: 'Арена. Зелёный класс',
        start: DateTime(2019, 11, 23, 13, 05),
        end: DateTime(2019, 11, 23, 14, 45),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.WORLD,
        name: '«Тренинг-дебаты «Лидерами становятся»',
        description:
            'Подоляк Илья Николаевич, Тренер по публичным выступлениям, основатель школы эффективного общения и публичных выступлений «Speak On» (Группа компаний «Россети») ',
        venue: 'Арена. Жёлтый класс',
        start: DateTime(2019, 11, 23, 13, 05),
        end: DateTime(2019, 11, 23, 14, 45),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.SECURITY,
        name: '«Концепт дизайн»',
        description:
            'Лепешкин Илья Александрович, Начальник Центра проектной деятельности, ФГБОУ ВО «Московский политехнический университет»',
        venue: 'Арена. Красный класс',
        start: DateTime(2019, 11, 23, 13, 05),
        end: DateTime(2019, 11, 23, 14, 45),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.INDUSTRIAL,
        name: '«Процессы в нашей жизни»',
        description: 'Кикоть Павел Сергеевич, Ведущий тренер Академии Ростеха',
        venue: 'Арена. Фиолетовый класс',
        start: DateTime(2019, 11, 23, 13, 05),
        end: DateTime(2019, 11, 23, 14, 45),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        name: 'Обед',
        venue: 'Ресторан. Гостиница «Юбилейная»',
        start: DateTime(2019, 11, 23, 14, 35),
        end: DateTime(2019, 11, 23, 16, 35),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name:
            'Знакомство с направлением. Распределение по кейсам. Введение в задачу кейса',
        venue: 'Арена. Классы',
        start: DateTime(2019, 11, 23, 16, 35),
        end: DateTime(2019, 11, 23, 17, 35),
      ),
      ForumEvent(
        name: 'Решение кейсов, экскурсии в Лабораторную зону',
        venue: 'Арена. Классы',
        start: DateTime(2019, 11, 23, 17, 35),
        end: DateTime(2019, 11, 23, 19, 35),
      ),
      ForumEvent(
        name: 'Кофе-пауза',
        venue: 'Арена',
        start: DateTime(2019, 11, 23, 19, 35),
        end: DateTime(2019, 11, 23, 19, 55),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Подведение итогов дня. Рефлексия',
        venue: 'Арена. Классы',
        start: DateTime(2019, 11, 23, 19, 55),
        end: DateTime(2019, 11, 23, 20, 20),
      ),
      ForumEvent(
        name: 'Трансфер из «Арены» в гостиницы',
        start: DateTime(2019, 11, 23, 20, 20),
        end: DateTime(2019, 11, 23, 20, 50),
      ),
      ForumEvent(
        name: 'Ужин',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 23, 21, 00),
        end: DateTime(2019, 11, 23, 22, 00),
        eventType: ForumEventType.FOOD,
      ),
    ],

    // 24 ноября
    [
      ForumEvent(
        name: 'Завтрак',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 24, 7, 00),
        end: DateTime(2019, 11, 24, 8, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Трансфер из гостиниц в «Арену»',
        start: DateTime(2019, 11, 24, 8, 15),
        end: DateTime(2019, 11, 24, 9, 00),
      ),
      ForumEvent(
        name: 'Проектная сессия: команда мечты для решения вызова',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 24, 9, 00),
        end: DateTime(2019, 11, 24, 10, 30),
      ),
      ForumEvent(
        name: 'Кофе-пауза',
        venue: 'Арена',
        start: DateTime(2019, 11, 24, 10, 30),
        end: DateTime(2019, 11, 24, 11, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Решение кейсов',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 24, 11, 00),
        end: DateTime(2019, 11, 24, 13, 00),
      ),
      ForumEvent(
        name: 'Обед',
        venue: 'Ресторан. Гостиница «Юбилейная»',
        start: DateTime(2019, 11, 24, 13, 00),
        end: DateTime(2019, 11, 24, 15, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        type: DirectionType.CULTURE,
        name:
            '«4К компетенции: критическое мышление, креативность, коммуникация и кооперация»',
        description:
            'Храмцов Дмитрий Сергеевич, Советник, ФГАУ «Фонд развития новых форм образования» (Государственная корпорация по космической деятельности «Роскосмос»)',
        venue: 'Арена. Синий класс',
        start: DateTime(2019, 11, 24, 15, 00),
        end: DateTime(2019, 11, 24, 16, 00),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.ECOLOGY,
        name: '«Энергетика будущего: профессии и компетенции»',
        description:
            'Адамов Евгений Олегович, Научный руководитель проектного направления «Прорыв», Государственная корпорация по атомной энергии «Росатом»',
        venue: 'Арена. Голубой класс',
        start: DateTime(2019, 11, 24, 15, 00),
        end: DateTime(2019, 11, 24, 16, 00),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.HEALTH,
        name: '«Роль потребностей пользователя в создании цифрового продукта»',
        description:
            'Бараева Валерия Сергеевна, Методист международной школы программирования для детей «Алгоритмика», сооснователь проекта «Розетка»',
        venue: 'Арена. Зелёный класс',
        start: DateTime(2019, 11, 24, 15, 00),
        end: DateTime(2019, 11, 24, 16, 00),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.WORLD,
        name:
            '«Искусственный интеллект и нейроморфные системы - снова производственной революции»',
        description:
            'Демин Вячеслав Александрович, Директор-координатор по направлению природоподобные технологии, НИЦ «Курчатовский институт»',
        venue: 'Арена. Жёлтый класс',
        start: DateTime(2019, 11, 24, 15, 00),
        end: DateTime(2019, 11, 24, 16, 00),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.SECURITY,
        name: '«Как мыслить научно?»',
        description:
            'Федоров Дмитрий Александрович, Начальник лаборатории динамики и прочности, АО «Конструкторское бюро специального машиностроения», АО «Концерн ВКО «Алмаз – Антей»',
        venue: 'Арена. Красный класс',
        start: DateTime(2019, 11, 24, 15, 00),
        end: DateTime(2019, 11, 24, 16, 00),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        type: DirectionType.INDUSTRIAL,
        name: '«Шаги к успеху или RPG в реальности»',
        description:
            'Большакова Ксения Евгеньевна, Эксперт по профориентации, SuperJob',
        venue: 'Арена. Фиолетовый класс',
        start: DateTime(2019, 11, 24, 15, 00),
        end: DateTime(2019, 11, 24, 16, 00),
        eventType: ForumEventType.LESSON,
      ),
      ForumEvent(
        name: 'Перерыв',
        venue: 'Арена',
        start: DateTime(2019, 11, 24, 16, 00),
        end: DateTime(2019, 11, 24, 16, 15),
      ),
      ForumEvent(
        name: 'Решение кейсов',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 24, 16, 15),
        end: DateTime(2019, 11, 24, 17, 45),
      ),
      ForumEvent(
        type: DirectionType.WORLD,
        name:
            'Экскурсия на Передвижной выставочно-лекционный комплекс ОАО «РЖД»',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 24, 16, 15),
        end: DateTime(2019, 11, 24, 17, 45),
      ),
      ForumEvent(
        name: 'Кофе-пауза',
        venue: 'Арена',
        start: DateTime(2019, 11, 24, 17, 45),
        end: DateTime(2019, 11, 24, 18, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Решение кейсов',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 24, 18, 00),
        end: DateTime(2019, 11, 24, 19, 00),
      ),
      ForumEvent(
        name: 'Подведение итогов дня. Рефлексия',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 24, 19, 00),
        end: DateTime(2019, 11, 24, 19, 30),
      ),
      ForumEvent(
        name: 'Трансфер',
        start: DateTime(2019, 11, 24, 19, 30),
        end: DateTime(2019, 11, 24, 20, 00),
      ),
      ForumEvent(
        name: 'Ужин',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 24, 20, 00),
        end: DateTime(2019, 11, 24, 21, 00),
        eventType: ForumEventType.FOOD,
      ),
    ],

    // 25 ноября
    [
      ForumEvent(
        name: 'Завтрак',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 25, 7, 00),
        end: DateTime(2019, 11, 25, 8, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Трансфер из гостиниц в «Арену»',
        start: DateTime(2019, 11, 25, 8, 15),
        end: DateTime(2019, 11, 25, 9, 00),
      ),
      ForumEvent(
        name: 'Решение кейсов',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 25, 9, 00),
        end: DateTime(2019, 11, 25, 10, 30),
      ),
      ForumEvent(
        name: 'Кофе-пауза',
        venue: 'Арена',
        start: DateTime(2019, 11, 25, 10, 30),
        end: DateTime(2019, 11, 25, 11, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name:
            'Общественно-профессиональное обсуждение лучших конкурсных работ педагогов',
        venue: 'Арена. Главный зал',
        start: DateTime(2019, 11, 25, 11, 00),
        end: DateTime(2019, 11, 25, 12, 00),
        eventType: ForumEventType.MAIN,
      ),
      ForumEvent(
        name: 'Обзорная экскурсия по городу',
        start: DateTime(2019, 11, 25, 12, 00),
        end: DateTime(2019, 11, 25, 13, 00),
      ),
      ForumEvent(
        name: 'Обед',
        venue: 'Ресторан. Гостиница «Юбилейная»',
        start: DateTime(2019, 11, 25, 13, 00),
        end: DateTime(2019, 11, 25, 15, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Решение кейсов',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 25, 15, 00),
        end: DateTime(2019, 11, 25, 16, 30),
      ),
      ForumEvent(
        name: 'Кофе-пауза',
        venue: 'Арена',
        start: DateTime(2019, 11, 25, 16, 30),
        end: DateTime(2019, 11, 25, 17, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Защита кейсов. Подведение итогов работы направлений',
        venue: 'Арена. Классы и Лабораторная зона',
        start: DateTime(2019, 11, 25, 17, 00),
        end: DateTime(2019, 11, 25, 19, 30),
      ),
      ForumEvent(
        name: 'Трансфер из «Арены» в гостиницы',
        start: DateTime(2019, 11, 25, 19, 30),
        end: DateTime(2019, 11, 25, 20, 30),
      ),
      ForumEvent(
        name: 'Ужин',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 25, 20, 30),
        end: DateTime(2019, 11, 25, 21, 30),
        eventType: ForumEventType.FOOD,
      ),
    ],

    // 26 ноября
    [
      ForumEvent(
        name: 'Завтрак',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 26, 7, 00),
        end: DateTime(2019, 11, 26, 8, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Трансфер из гостиниц в «Арену»',
        start: DateTime(2019, 11, 26, 8, 15),
        end: DateTime(2019, 11, 26, 9, 00),
      ),
      ForumEvent(
        name: 'Подведение итогов работы направлений',
        venue: 'Арена. Классы',
        start: DateTime(2019, 11, 26, 9, 00),
        end: DateTime(2019, 11, 26, 9, 30),
      ),
      ForumEvent(
        name:
            'Лекции в TED-формате от партнеров Форума (VIP-гости от компаний)',
        venue: 'Арена. Главный зал',
        start: DateTime(2019, 11, 26, 10, 00),
        end: DateTime(2019, 11, 26, 11, 00),
        eventType: ForumEventType.MAIN,
      ),
      ForumEvent(
        name: 'Кофе-пауза',
        venue: 'Арена',
        start: DateTime(2019, 11, 26, 11, 00),
        end: DateTime(2019, 11, 26, 11, 30),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'VIP-обход в зоне лабораторий',
        venue: 'Арена. Лабораторная Зона',
        start: DateTime(2019, 11, 26, 11, 00),
        end: DateTime(2019, 11, 26, 12, 00),
        eventType: ForumEventType.MAIN,
      ),
      ForumEvent(
        name: 'Большой открытый урок «Школа завтрашнего дня»',
        venue: 'Арена. Главный зал',
        start: DateTime(2019, 11, 26, 12, 00),
        end: DateTime(2019, 11, 26, 13, 00),
        eventType: ForumEventType.MAIN,
      ),
      ForumEvent(
        name: 'Кофе-пауза',
        venue: 'Арена',
        start: DateTime(2019, 11, 26, 13, 00),
        end: DateTime(2019, 11, 26, 13, 30),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Ректорский час',
        venue: 'Арена. Главный зал',
        start: DateTime(2019, 11, 26, 13, 30),
        end: DateTime(2019, 11, 26, 15, 00),
        eventType: ForumEventType.MAIN,
      ),
      ForumEvent(
        name: 'Обед',
        venue: 'Ресторан. Гостиница «Юбилейная»',
        start: DateTime(2019, 11, 26, 15, 00),
        end: DateTime(2019, 11, 26, 17, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name:
            'Подведение итогов Форума. Церемония закрытия. Награждение победителей',
        venue: 'Арена. Главный зал',
        start: DateTime(2019, 11, 26, 17, 00),
        end: DateTime(2019, 11, 26, 18, 30),
        eventType: ForumEventType.MAIN,
      ),
      ForumEvent(
        name: 'Фуршет',
        venue: 'Арена. Классы',
        start: DateTime(2019, 11, 26, 18, 30),
        end: DateTime(2019, 11, 26, 19, 00),
        eventType: ForumEventType.FOOD,
      ),
      ForumEvent(
        name: 'Дискотека',
        venue: 'Арена. Классы',
        start: DateTime(2019, 11, 26, 19, 00),
        end: DateTime(2019, 11, 26, 20, 30),
      ),
      ForumEvent(
        name: 'Трансфер из «Арены» в гостиницы',
        start: DateTime(2019, 11, 26, 20, 30),
        end: DateTime(2019, 11, 26, 21, 00),
      ),
      ForumEvent(
        name: 'Ужин',
        venue: 'Гостиницы',
        start: DateTime(2019, 11, 26, 21, 00),
        end: DateTime(2019, 11, 26, 22, 00),
        eventType: ForumEventType.FOOD,
      ),
    ],
  ];

  static List<ForumEvent> getCurrentEvents(int today) {
    var currentEvents = <ForumEvent>[];

    ForumData.schedule.forEach((d) {
      final isCurrentDay = (today >= d.first.start.millisecondsSinceEpoch) &&
          (today <= d.last.end.millisecondsSinceEpoch);

      if (!isCurrentDay) return;

      d.forEach((event) {
        final isCurrentEvent = (today >= event.start.millisecondsSinceEpoch) &&
            (today <= event.end.millisecondsSinceEpoch);

        if (isCurrentEvent) currentEvents.add(event);
      });
    });

    return currentEvents;
  }

  static ForumEvent getNextEvent(int today) {
    ForumEvent nextEvent;
    bool saveNextEvent = false;

    ForumData.schedule.forEach((d) {
      final isCurrentDay = (today >= d.first.start.millisecondsSinceEpoch) &&
          (today <= d.last.end.millisecondsSinceEpoch);

      if (!isCurrentDay) return;

      d.forEach((event) {
        final isCurrentEvent = (today >= event.start.millisecondsSinceEpoch) &&
            (today <= event.end.millisecondsSinceEpoch);

        if (isCurrentEvent) {
          saveNextEvent = true;
          return;
        }

        if (saveNextEvent) {
          nextEvent = event;
          saveNextEvent = false;
          return;
        }
      });
    });

    return nextEvent;
  }

  static bool isForumDay(DateTime day) {
    if (ForumData.schedule.isEmpty) return false;

    var firstEvent = ForumData.schedule.first.first;
    var lastEvent = ForumData.schedule.last.last;

    var dts = day.millisecondsSinceEpoch;

    return firstEvent.start.millisecondsSinceEpoch <= dts &&
        lastEvent.end.millisecondsSinceEpoch > dts;
  }
}
