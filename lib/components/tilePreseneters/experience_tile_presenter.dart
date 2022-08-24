import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

Widget experienceGridTilePresenter({
  required Widget image,
  required String title,
  required String subtitle,
  required Function() onTap,
}) {
  return Card(
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          image,
          emptySpace(1),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(subtitle, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
