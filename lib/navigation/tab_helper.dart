import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:proektoria/navigation/page.dart';
import 'package:proektoria/navigation/tab.dart';
import 'package:proektoria/ui/pages/home_page.dart';
import 'package:proektoria/ui/pages/map_page.dart';
import 'package:proektoria/ui/pages/notes_page.dart';
import 'package:proektoria/ui/pages/schedule_page.dart';

class NavigationTabHelper {
  static final List<NavigationTab> tabs = [
    NavigationTab(
        OMIcons.home, 'Главная', NavigationPage(HomePage(DateTime.now()))),
    NavigationTab(OMIcons.event, 'Расписание', NavigationPage(SchedulePage())),
    NavigationTab(OMIcons.notes, 'Заметки', NavigationPage(NotesPage())),
    NavigationTab(OMIcons.map, 'Карта', NavigationPage(MapPage()))
  ];
}
