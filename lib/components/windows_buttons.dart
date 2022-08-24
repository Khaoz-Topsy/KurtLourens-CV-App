import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color hoverColour = getTheme().getSecondaryColour(context);
    Color textColour = getTheme().getTextColour(context);
    Color textHoverColour = getTheme().getForegroundTextColour(hoverColour);

    WindowButtonColors buttonColors = WindowButtonColors(
      mouseOver: hoverColour,
      mouseDown: hoverColour,
      iconNormal: textColour,
      iconMouseOver: textHoverColour,
    );

    HexColor closeButtonRed = HexColor('E81123');
    WindowButtonColors closeButtonColors = WindowButtonColors(
      mouseOver: closeButtonRed,
      mouseDown: closeButtonRed,
      iconNormal: textColour,
      iconMouseOver: textHoverColour,
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
