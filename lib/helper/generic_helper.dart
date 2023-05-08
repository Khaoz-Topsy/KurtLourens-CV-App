import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

const int maxNumberOfRowsForRecipeCategory = 3;

Widget genericItemImage(BuildContext context, String imagePath,
        {bool disableZoom = false,
        double height = 100,
        String name = 'Zoom',
        bool hdAvailable = false,
        Function()? onTap}) =>
    Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(4.0),
          child: LocalImage(imagePath: imagePath, height: height),
        ),
      ),
    );

Widget genericChip(
  context,
  String title, {
  Color? color,
  Function()? onTap,
}) {
  return genericChipWidget(
    context,
    Text(title),
    color: color,
    onTap: onTap,
  );
}

Widget genericChipWidget(
  context,
  Widget content, {
  Color? color,
  Function()? onTap,
}) {
  var child = Padding(
    padding: const EdgeInsets.only(left: 4),
    child: Chip(
      label: content,
      backgroundColor: color ?? getTheme().getSecondaryColour(context),
    ),
  );
  return (onTap == null)
      ? child
      : GestureDetector(
          onTap: onTap,
          child: child,
        );
}

Widget gridIconTilePresenter(BuildContext innerContext, String imageprefix,
        String imageAddress, Function(String icon) onTap) =>
    genericItemImage(
      innerContext,
      '$imageprefix$imageAddress',
      disableZoom: true,
      onTap: () => onTap(imageAddress),
    );

String padString(String input, int numChars) {
  String padding = '';
  for (var paddingIndex = 0;
      paddingIndex < numChars - input.length;
      paddingIndex++) {
    padding += '0';
  }
  return padding + input;
}
