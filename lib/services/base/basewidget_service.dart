import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../components/adaptive/app_appbar.dart';
import '../../components/adaptive/appbar_for_subpage.dart';
import '../../components/adaptive/app_scaffold.dart';

class BaseWidgetService implements IBaseWidgetService {
  @override
  Widget appScaffold(
    BuildContext context, {
    required PreferredSizeWidget appBar,
    Widget? body,
    Widget Function(BuildContext scaffoldContext)? builder,
    Widget? drawer,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) =>
      adaptiveAppScaffold(
        context,
        appBar: appBar,
        body: body,
        builder: builder,
        drawer: drawer,
        // bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      );

  @override
  Widget appBar(
    BuildContext context,
    Widget title,
    List<Widget> actions, {
    Widget? leading,
    PreferredSizeWidget? bottom,
  }) =>
      adaptiveAppBar(context, title, actions, leading: leading, bottom: bottom);

  @override
  PreferredSizeWidget appBarForSubPage(
    BuildContext context, {
    Widget? title,
    List<ActionItem>? actions,
    List<ActionItem>? shortcutActions,
    bool showHomeAction = false,
    bool showBackAction = true,
  }) =>
      adaptiveAppBarForSubPageHelper(
        context,
        title: title,
        actions: actions,
        shortcutActions: shortcutActions,
        showBackAction: showBackAction,
        showHomeAction: showHomeAction,
      );

  @override
  Widget adaptiveCheckbox(
      {Key? key,
      required bool value,
      required void Function(bool newValue) onChanged,
      Color? activeColor}) {
    // TODO: implement adaptiveCheckbox
    throw UnimplementedError();
  }

  @override
  Widget appChip({
    Key? key,
    String? text,
    Widget? label,
    TextStyle? style,
    EdgeInsets? labelPadding,
    double? elevation,
    EdgeInsets? padding,
    Color? shadowColor,
    Icon? deleteIcon,
    void Function()? onDeleted,
    void Function()? onTap,
    Color? backgroundColor,
  }) =>
      AdaptiveChip(
        key: key,
        text: text,
        label: label,
        style: style,
        labelPadding: labelPadding,
        elevation: elevation,
        padding: padding,
        shadowColor: shadowColor,
        deleteIcon: deleteIcon,
        onDeleted: onDeleted,
        onTap: onTap,
        backgroundColor: backgroundColor,
      );

  @override
  Widget basicBadge({
    Key? key,
    required String text,
    required Widget? child,
    Color? textColour,
  }) =>
      BasicBadge(
        key: key,
        text: text,
        textColour: textColour ?? Colors.black,
        child: child,
      );

  @override
  int tabletBreakpoint() => 800;

  @override
  int desktopBreakpoint() => 1440;

  @override
  Widget customDivider() => isWeb
      ? Divider(thickness: .5, color: Colors.grey[800])
      : Divider(color: Colors.grey[800]);
}
