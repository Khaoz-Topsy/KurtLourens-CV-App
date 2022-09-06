import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../helper/generic_helper.dart';

Widget responsiveStaggeredGridTilePresenter(
  IconData icon,
  Color backgroundColor, {
  Color? iconColor,
  String? text,
  Function()? onTap,
}) =>
    Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () {
          if (onTap != null) onTap();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor ?? Colors.white,
            ),
            (text != null)
                ? const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text('test'),
                  )
                : const SizedBox(width: 0, height: 0),
          ],
        ),
      ),
    );

Widget responsiveStaggeredGridImageTilePresenter(
  BuildContext context,
  String imgPath, {
  Color? iconColor,
  LocaleKey? text,
  Function()? onTap,
}) {
  void Function() safeOnTap;
  safeOnTap = () {
    if (onTap != null) onTap();
  };
  return responsiveStaggeredGridBaseTilePresenter(
    context,
    genericItemImage(context, imgPath, height: 1000, onTap: safeOnTap),
    iconColor: iconColor,
    text: text,
    onTap: safeOnTap,
  );
}

Widget responsiveStaggeredGridIconTilePresenter(
  BuildContext context,
  IconData icon, {
  Color? iconColor,
  LocaleKey? text,
  double? height,
  Function()? onTap,
}) {
  void Function() safeOnTap;
  safeOnTap = () {
    if (onTap != null) onTap();
  };
  return responsiveStaggeredGridBaseTilePresenter(
    context,
    Center(
        child: getCorrectlySizedImageFromIcon(
      context,
      icon,
      maxSize: 45,
      colour: Colors.white,
    )),
    iconColor: iconColor,
    text: text,
    onTap: safeOnTap,
  );
}

Widget responsiveStaggeredGridBaseTilePresenter(
  BuildContext context,
  Widget image, {
  Color? iconColor,
  LocaleKey? text,
  Function()? onTap,
}) {
  void Function() safeOnTap;
  safeOnTap = () {
    if (onTap != null) onTap();
  };

  // var backgroundColor = backgroundColor;
  // var backgroundColor =HexColor("4B7287");
  // var backgroundColor = HexColor("21536C");
  var backgroundColor = getTheme().getSecondaryColour(context);
  List<Widget> children = List.empty(growable: true);
  // children.add(Center(child: image));
  children.add(
    Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 24),
      child: image,
    ),
  );
  if (text != null) {
    children.add(Positioned(
      bottom: 4,
      left: 4,
      right: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          getTranslations().fromKey(text),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: getTheme().getForegroundTextColour(backgroundColor),
          ),
        ),
      ),
    ));
  }

  var child = children.length == 1
      ? children[0]
      : Stack(
          children: children,
          // mainAxisAlignment: MainAxisAlignment.center,
        );

  return Card(
    color: backgroundColor,
    child: InkWell(onTap: safeOnTap, child: child),
  );
}
