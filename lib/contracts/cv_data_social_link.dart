import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

class CvDataSocialLink {
  final String link;
  final String classNames;
  final String title;
  final String image;
  final String onClick;

  CvDataSocialLink({
    required this.link,
    required this.classNames,
    required this.title,
    required this.image,
    required this.onClick,
  });

  factory CvDataSocialLink.fromRawJson(String str) =>
      CvDataSocialLink.fromJson(json.decode(str));

  factory CvDataSocialLink.fromJson(Map<String, dynamic> json) =>
      CvDataSocialLink(
        link: readStringSafe(json, 'link'),
        classNames: readStringSafe(json, 'classNames'),
        title: readStringSafe(json, 'title'),
        image: readStringSafe(json, 'image'),
        onClick: readStringSafe(json, 'onClick'),
      );
}
