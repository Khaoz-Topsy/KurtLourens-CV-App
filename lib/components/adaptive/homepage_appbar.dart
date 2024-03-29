import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/cupertino.dart' show ObstructingPreferredSizeWidget;
import 'package:flutter/material.dart';

import 'app_appbar.dart';

class HomePageAppBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  final String title;
  final List<ActionItem>? actions;
  @override
  final Size preferredSize;
  final dynamic bottom;
  final Color? backgroundColor;
  static const double kMinInteractiveDimensionCupertino = 44.0;

  HomePageAppBar(this.title,
      {Key? key, this.bottom, this.backgroundColor, this.actions})
      : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // actions?.add(ActionItem(
    //   icon: Icons.settings,
    //   onPressed: () async => await getNavigation().navigateAsync(
    //     context,
    //     navigateToNamed: Routes.settings,
    //   ),
    // ));
    return _androidAppBarActions(context, Text(title), actions);
  }

  Widget _androidAppBarActions(
    context,
    Widget title,
    List<ActionItem>? actions,
  ) {
    List<Widget> widgets = List.empty(growable: true);
    widgets.addAll(
      actionItemToAndroidAction(context, actions ?? List.empty(growable: true)),
    );
    return adaptiveAppBar(
      context,
      title,
      widgets,
      bottom: bottom,
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}

PreferredSizeWidget homePageAppBar(String title,
    {List<ActionItem>? customActions}) {
  List<ActionItem> actions = customActions ?? List.empty(growable: true);
  return HomePageAppBar(
    title,
    actions: actions,
  );
}
