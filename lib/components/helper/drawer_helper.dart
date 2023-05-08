import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../constants/homepage_items.dart';
import '../../contracts/homepage_menu_item.dart';

List<Widget> getDrawerItems(context) {
  List<Widget> widgets = List.empty(growable: true);
  Color drawerIconColour = getTheme().getDarkModeSecondaryColour();

  widgets.add(const EmptySpace(0.5));
  widgets.addAll(_mapToDrawerItem(
    context,
    getMenuOptionsSection1(context, drawerIconColour),
  ));
  widgets.add(customDivider());

  widgets.add(
    FutureBuilder<ResultWithValue<VersionDetail>>(
      future: getUpdate().getPackageInfo(),
      builder: (BuildContext context,
          AsyncSnapshot<ResultWithValue<VersionDetail>> snapshot) {
        Widget? errorWidget = asyncSnapshotHandler(context, snapshot,
            loader: () => getLoading().loadingIndicator());
        if (errorWidget != null) return Container();

        ResultWithValue<VersionDetail>? packageInfoResult = snapshot.data;
        String appVersionString =
            'Version: ${packageInfoResult?.value.version}';

        return ListTile(
          key: const Key('versionNumber'),
          leading: const CorrectlySizedImageFromIcon(icon: Icons.code),
          title: Text(appVersionString),
          onTap: () {},
          dense: true,
        );
      },
    ),
  );
  widgets.add(const EmptySpace3x());

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
