import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

Widget experienceGridTilePresenter({
  required Widget image,
  required String title,
  required String subtitle,
  required Function() onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.125),
          blurRadius: 8.0,
          spreadRadius: 0.0,
          offset: const Offset(0.0, 5.0),
        )
      ],
    ),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: image,
            ),
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
                  emptySpace(0.5),
                  Text(subtitle, maxLines: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
