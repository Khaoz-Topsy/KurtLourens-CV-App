import 'package:flutter/material.dart';

import '../pages/about_page.dart';
import '../pages/home_page.dart';

class Routes {
  static const String home = '/home';
  static const String about = '/about';
}

Map<String, Widget Function(BuildContext)> initNamedRoutes() {
  Map<String, WidgetBuilder> routes = {
    Routes.home: (context) => Homepage(),
    Routes.about: (context) => AboutPage(),
  };
  return routes;
}
