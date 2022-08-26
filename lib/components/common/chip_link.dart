import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

Widget chipLink(
  BuildContext context, {
  required String label,
  String? externalUrl,
  Color? foregroundColor,
  Color? backgroundColor,
}) {
  Chip chipContent = Chip(
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(color: foregroundColor ?? Colors.black),
        ),
        if (externalUrl != null) ...[
          emptySpace(0.5),
          const Icon(Icons.link, color: Colors.black),
        ],
      ],
    ),
    backgroundColor: backgroundColor ?? getTheme().getSecondaryColour(context),
  );

  if (externalUrl == null) return chipContent;

  return GestureDetector(
    onTap: () => launchExternalURL(externalUrl),
    child: chipContent,
  );
}
