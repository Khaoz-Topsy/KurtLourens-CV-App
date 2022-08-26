import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

class ExperienceGridTilePresenter extends StatefulWidget {
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
  createState() => _ExperienceGridTilePresenterState();
}

class _ExperienceGridTilePresenterState
    extends State<ExperienceGridTilePresenter> {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = const Offset(0, 0);

  @override
  Widget build(context) {
    return Transform.translate(
      offset: translate,
      child: Transform.scale(
        scale: scale,
        child: Container(
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
              onHover: (isHovered) {
                if (isHovered) {
                  setState(() {
                    elevation = 20.0;
                    scale = 1.02;
                    translate = const Offset(0, -2);
                  });
                } else {
                  setState(() {
                    elevation = 4.0;
                    scale = 1.0;
                    translate = const Offset(0, 0);
                  });
                }
              },
              onTap: widget.onTap,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: widget.image,
                  ),
                  emptySpace(1),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20),
                        ),
                        emptySpace(0.5),
                        Text(widget.subtitle, maxLines: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
