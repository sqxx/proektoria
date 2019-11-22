import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proektoria/data/ForumData.dart';
import 'package:proektoria/navigation/NavigationData.dart';
import 'package:proektoria/navigation/NavigationHelper.dart';
import 'package:proektoria/navigation/NavigationTab.dart';
import 'package:proektoria/ui/controls/libs/beautiful_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NavigationTab _currentTab = NavigationData.getTabs()[0];

  @override
  Widget build(BuildContext context) {
    // Делаем использование приложения невозможным вне форума
    if (!ForumData.isForumDay(ForumData.today)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NavigationHelper.finalNamedNavigation(context, '/wait_forum');
      });

      // Возврат пустого экрана,
      //   ведь после этого произойдёт перенавигация на другой экран
      return Scaffold();
    }

    // Создание панели навигации
    var navigationBar = BeautifulNavigationBar(
      onItemSelected: (index) => _selectTab(NavigationData.getTabs()[index]),
      items: NavigationData.getTabs(),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 220),
            child: _currentTab.page.content,
          ),
        ),
        bottomNavigationBar: navigationBar,
      ),
    );
  }

  void _selectTab(NavigationTab navigationTab) {
    setState(() {
      _currentTab = navigationTab;
    });
  }
}
