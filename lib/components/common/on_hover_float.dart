import 'package:flutter/material.dart';

import '../../constants/app_border.dart';

class OnHoverFloat extends StatefulWidget {
  final Widget content;
  final void Function() onTap;

  const OnHoverFloat({
    Key? key,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  createState() => _OnHoverFloatState();
}

class _OnHoverFloatState extends State<OnHoverFloat> {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = const Offset(0, 0);

  @override
  Widget build(context) {
    return Transform.translate(
      offset: translate,
      child: Transform.scale(
        scale: scale,
        child: InkWell(
          borderRadius: defaultImageBorderRadius,
          onTap: widget.onTap,
          child: widget.content,
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
        ),
      ),
    );
  }
}
