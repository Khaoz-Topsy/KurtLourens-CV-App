import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_image.dart';

class CustomSpinner extends StatefulWidget {
  final double height;
  final double width;
  final Duration spinDuration;
  const CustomSpinner({
    Key? key,
    this.height = 50.0,
    this.width = 50.0,
    this.spinDuration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  createState() => _CustomSpinnerWidget();
}

class _CustomSpinnerWidget extends State<CustomSpinner>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.spinDuration,
      vsync: this,
    );

    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.repeat();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: const Image(
          image: AssetImage(AppImage.customLoading),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
