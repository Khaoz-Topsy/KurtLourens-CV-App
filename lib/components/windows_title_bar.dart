import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart' show ObstructingPreferredSizeWidget;
import 'package:flutter/material.dart';

import '../constants/app_image.dart';

class WindowsTitleBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  final String title;
  final List<ActionItem>? actions;
  @override
  final Size preferredSize;
  final dynamic bottom;
  final Color? backgroundColor;
  static const double kMinInteractiveDimensionCupertino = 44.0;

  WindowsTitleBar(this.title,
      {Key? key, this.bottom, this.backgroundColor, this.actions})
      : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        color: getTheme().getScaffoldBackgroundColour(context),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(4),
              child: LocalImage(imagePath: AppImage.windowIcon),
            ),
            Expanded(
              child: MoveWindow(
                child: Center(
                    child: Row(
                  children: [
                    GenericItemDescription(title),
                  ],
                )),
              ),
            ),
            const WindowButtons(),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
