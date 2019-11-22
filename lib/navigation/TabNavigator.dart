import 'package:flutter/material.dart';
import 'package:proektoria/navigation/NavigationTab.dart';

class TabNavigator extends StatelessWidget {
  static const _root = '/';

  TabNavigator({this.navigatorKey, this.navigationTab});

  final GlobalKey<NavigatorState> navigatorKey;
  final NavigationTab navigationTab;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      _root: (context) => navigationTab.page.content,
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: _root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context));
      },
    );
  }
}
