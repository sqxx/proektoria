import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:proektoria/navigation/NavigationPage.dart';
import 'package:proektoria/navigation/NavigationTab.dart';
import 'package:proektoria/ui/pages/AboutPage.dart';
import 'package:proektoria/ui/pages/HomePage.dart';
import 'package:proektoria/ui/pages/MapPage.dart';
import 'package:proektoria/ui/pages/SchedulePage.dart';

class NavigationData {
  static List<NavigationTab> _tabs = [];

  static List<NavigationTab> getTabs() => _tabs;

  static void rebuildTabs() {
    _tabs = [
      NavigationTab(
        name: 'Главная',
        icon: OMIcons.home,
        page: NavigationPage(content: HomePage()),
      ),
      NavigationTab(
        name: 'Расписание',
        icon: OMIcons.event,
        page: NavigationPage(content: SchedulePage()),
      ),
      NavigationTab(
        name: 'Карта',
        icon: OMIcons.map,
        page: NavigationPage(content: MapPage()),
      ),
      NavigationTab(
        name: 'ПроеКТОриЯ',
        icon: OMIcons.info,
        page: NavigationPage(content: AboutPage()),
      )
    ];
  }
}
