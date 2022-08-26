import 'package:flutter/material.dart';

class HomepageMenuItem {
  Widget image;
  String title;
  String? navigateToNamed;
  void Function(BuildContext)? onTap;
  HomepageMenuItem({
    required this.image,
    required this.title,
    this.navigateToNamed,
    this.onTap,
  });
}

const double imageSize = 37;
