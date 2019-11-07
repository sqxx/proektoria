import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proektoria/navigation/tab.dart';
import 'package:proektoria/navigation/tab_helper.dart';
import 'package:proektoria/navigation/tab_navigator.dart';
import 'package:proektoria/ui/controls/beautiful_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NavigationTab _currentTab = NavigationTabHelper.tabs[0];

  Map<NavigationTab, GlobalKey<NavigatorState>> _navigatorKeys = Map();

  bool isBottomNavBarToBeShown = true;

  @override
  Widget build(BuildContext context) {
    if (_navigatorKeys.isEmpty) _makeNavigationMap();

    List<Widget> _navigators = [];
    _navigatorKeys.forEach((navigationTab, globalKey) =>
        _navigators.add(_buildOffstageNavigator(navigationTab)));

    var navigationBar = BeautifulNavigationBar(
      onItemSelected: (index) => _selectTab(NavigationTabHelper.tabs[index]),
      items: NavigationTabHelper.tabs,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: _navigators,
          ),
        ),
        bottomNavigationBar: navigationBar,
      ),
    );
  }

  Widget _buildOffstageNavigator(NavigationTab navigationTab) {
    return Offstage(
      offstage: _currentTab != navigationTab,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[navigationTab],
        navigationTab: navigationTab,
      ),
    );
  }

  void _makeNavigationMap() {
    for (NavigationTab tab in NavigationTabHelper.tabs) {
      _navigatorKeys.addAll(
        {
          tab: GlobalKey<NavigatorState>(),
        },
      );
    }
  }

  void _selectTab(NavigationTab navigationTab) {
    setState(() {
      _currentTab = navigationTab;
    });
  }
}
