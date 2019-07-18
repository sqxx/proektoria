import 'package:proektoria/data/colors.dart';
import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/forum_direction.dart';

class ForumData {
  static var forumDirections = <ForumDirection>[
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
}
