import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../contracts/homepage_menu_item.dart';
import 'app_image.dart';
import 'app_routes.dart';

List<HomepageMenuItem> getMenuOptionsSection1(
  BuildContext context,
  Color drawerIconColour,
) {
  //
  Widget localGetFromIcon(IconData icon) =>
      getCorrectlySizedImageFromIcon(context, icon,
          colour: drawerIconColour, maxSize: imageSize);

  return [
    HomepageMenuItem(
      image: getListTileImage(AppImage.windowIcon, size: imageSize),
      title: 'Test',
      navigateToNamed: Routes.home,
    ),
  ];
}
