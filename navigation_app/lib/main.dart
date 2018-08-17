import 'package:flutter/material.dart';
import './views/settings.dart';
import './views/browser.dart';

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

void main() => runApp(new NavigationApp());

class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        //all available pages
        '/Settings': (BuildContext context) => new Settings(),
        '/Browser': (BuildContext context) => new Browser(),
      },
      home: new Settings(), //first page displayed
      navigatorObservers: [routeObserver],
    );
  }
}