import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

Widget adaptiveAppBar(
  context,
  Widget? title,
  List<Widget> actions, {
  Widget? leading,
  PreferredSizeWidget? bottom,
}) {
  return _customAndroidAppBar(context, title, actions,
      leading: leading, bottom: bottom);
}

Widget _customAndroidAppBar(
  context,
  Widget? title,
  List<Widget> actions, {
  Widget? leading,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    leading: leading,
    title: title,
    centerTitle: true,
    actions: actions,
    backgroundColor: getTheme().getPrimaryColour(context),
    bottom: bottom,
  );
}
