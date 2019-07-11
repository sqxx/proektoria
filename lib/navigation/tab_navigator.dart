import 'package:flutter/material.dart';
import 'package:proektoria/navigation/tab.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.navigationTab});

  final GlobalKey<NavigatorState> navigatorKey;
  final NavigationTab navigationTab;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {TabNavigatorRoutes.root: (context) => navigationTab.page.child};
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}
