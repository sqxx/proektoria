import 'package:flutter/material.dart';
import 'package:proektoria/controls/navbar/beautiful_navigation_bar.dart';
import 'package:proektoria/navigation/tab.dart';
import 'package:proektoria/navigation/tab_helper.dart';
import 'package:proektoria/navigation/tab_navigator.dart';

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  NavigationTab currentTab = NavigationTabHelper.tabs[0];
  Map<NavigationTab, GlobalKey<NavigatorState>> navigatorKeys = Map();

  void _selectTab(NavigationTab navigationTab) {
    setState(() {
      currentTab = navigationTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorKeys.isEmpty) _makeNavigationMap();

    List<Widget> navigators = [];
    navigatorKeys.forEach((navigationTab, globalKey) =>
        navigators.add(_buildOffstageNavigator(navigationTab)));

    var navigationBar = BeautifulNavigationBar(
      onItemSelected: (index) => _selectTab(NavigationTabHelper.tabs[index]),
      items: NavigationTabHelper.tabs,
    );

    return WillPopScope(
        onWillPop: () async =>
            !await navigatorKeys[currentTab].currentState.maybePop(),
        child: Scaffold(
            body: SafeArea(child: Stack(children: navigators)),
            bottomNavigationBar: navigationBar));
  }

  void _makeNavigationMap() {
    for (NavigationTab tab in NavigationTabHelper.tabs) {
      navigatorKeys.addAll({tab: GlobalKey<NavigatorState>()});
    }
  }

  Widget _buildOffstageNavigator(NavigationTab navigationTab) {
    return Offstage(
      offstage: currentTab != navigationTab,
      child: TabNavigator(
        navigatorKey: navigatorKeys[navigationTab],
        navigationTab: navigationTab,
      ),
    );
  }
}
