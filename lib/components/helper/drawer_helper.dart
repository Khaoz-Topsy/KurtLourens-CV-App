import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../constants/homepage_items.dart';
import '../../contracts/homepage_menu_item.dart';

List<Widget> getDrawerItems(context) {
  List<Widget> widgets = List.empty(growable: true);
  Color drawerIconColour = getTheme().getDarkModeSecondaryColour();

  widgets.addAll(_mapToDrawerItem(
    context,
    getMenuOptionsSection1(context, drawerIconColour),
  ));
  widgets.add(customDivider());

  // widgets.add(_drawerItem(
  //   context,
  //   image: getListTileImage(AppImage.assistantApps),
  //   key: LocaleKey.assistantApps,
  //   onTap: (_) {
  //     adaptiveBottomModalSheet(
  //       context,
  //       hasRoundedCorners: true,
  //       builder: (BuildContext innerC) => AssistantAppsModalBottomSheet(
  //         appType: AssistantAppType.NMS,
  //       ),
  //     );
  //   },
  // ));
  widgets.add(emptySpace3x());

  return widgets;
}

Widget _drawerItem(
  BuildContext context, {
  required Widget image,
  required String title,
  String? navigateToNamed,
  Function(BuildContext)? onTap,
}) {
  ListTile tile = ListTile(
    key: Key('$image-${title.toString()}'),
    leading: image,
    title: Text(title),
    dense: true,
    onTap: () async {
      if (onTap != null) {
        onTap(context);
        return;
      }

      if (navigateToNamed != null) {
        await getNavigation().navigateAwayFromHomeAsync(context,
            navigateToNamed: navigateToNamed);
      }
    },
  );
  return tile;
}

List<Widget> _mapToDrawerItem(
    BuildContext context, List<HomepageMenuItem> menus) {
  List<Widget> widgets = List.empty(growable: true);
  for (HomepageMenuItem menu in menus) {
    widgets.add(_drawerItem(
      context,
      title: menu.title,
      image: menu.image,
      navigateToNamed: menu.navigateToNamed,
      onTap: menu.onTap,
    ));
  }
  return widgets;
}
