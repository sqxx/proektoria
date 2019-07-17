import 'colors.dart';
import 'forum_direction.dart';

class ForumData {
  static var forumDirections = <ForumDirection>[
    ForumDirection('Технологии Материалов', '', AppColors.MATERIALS_CLUSTER),
    ForumDirection('Технологии Движения', '', AppColors.MOVEMENT_CLUSTER),
    ForumDirection('Космические Технологии', '', AppColors.SPACE_CLUSTER),
    ForumDirection('Технологии Энергии', '', AppColors.ENERGY_CLUSTER),
    ForumDirection('IT Технологии', '', AppColors.IT_CLUSTER),
    ForumDirection('Технологии Здоровья', '', AppColors.HEALTH_CLUSTER),
  ];
}
