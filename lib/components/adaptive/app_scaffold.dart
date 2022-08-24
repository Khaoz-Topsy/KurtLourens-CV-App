import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

Widget adaptiveAppScaffold(
  BuildContext context, {
  required PreferredSizeWidget appBar,
  Widget? body,
  Widget Function(BuildContext scaffoldContext)? builder,
  Widget? drawer,
  Widget? floatingActionButton,
  FloatingActionButtonLocation? floatingActionButtonLocation,
}) {
  Widget? customBody = builder != null //
      ? Builder(builder: (inner) => builder(inner))
      : body;
  return _androidScaffold(
    context,
    appBar: appBar,
    body: customBody,
    drawer: drawer,
    floatingActionButton: floatingActionButton,
    floatingActionButtonLocation: floatingActionButtonLocation,
  );
}

Widget _androidScaffold(
  BuildContext context, {
  required PreferredSizeWidget appBar,
  Widget? body,
  Widget? drawer,
  Widget? floatingActionButton,
  FloatingActionButtonLocation? floatingActionButtonLocation,
}) {
  return WillPopScope(
    onWillPop: () => getNavigation().navigateBackOrHomeAsync(context),
    child: Scaffold(
      appBar: appBar,
      body: body,
      // body: animateWidgetIn(
      //   child: BackgroundWrapper(
      //     key: Key(bgType.toString()),
      //     backgroundType: bgType,
      //     body: body,
      //   ),
      // ),
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    ),
  );
}
