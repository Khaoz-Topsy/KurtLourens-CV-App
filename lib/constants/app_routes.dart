import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class Routes {
  static const String home = '/home';
  static const String about = '/about';
}

Map<String, Widget Function(BuildContext)> initNamedRoutes() {
  Map<String, WidgetBuilder> routes = {
    Routes.home: (context) => Homepage(),
    Routes.about: (context) => AboutPage(
          key: const Key('AboutPage'),
          appType: AssistantAppType.NMS,
          aboutPageWidgetsFunc: (BuildContext ctx) {
            return [
              emptySpace(0.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  getTranslations().fromKey(LocaleKey.aboutContent),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 50,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ];
          },
        ),
  };
  return routes;
}
