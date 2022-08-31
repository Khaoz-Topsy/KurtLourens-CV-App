import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../common/on_hover_float.dart';

class ExperienceGridTilePresenter extends StatelessWidget {
  final Widget image;
  final String title;
  final String subtitle;
  final Function() onTap;

  const ExperienceGridTilePresenter({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: OnHoverFloat(
        onTap: onTap,
        content: Container(
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
      ),
    );
  }
}
