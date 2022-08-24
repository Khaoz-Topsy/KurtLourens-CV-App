import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

class CvDataLink {
  String url;
  String alt;
  String text;

  CvDataLink({
    required this.url,
    required this.alt,
    required this.text,
  });

  factory CvDataLink.fromRawJson(String str) =>
      CvDataLink.fromJson(json.decode(str));

  factory CvDataLink.fromJson(Map<String, dynamic> json) => CvDataLink(
        url: readStringSafe(json, 'url'),
        alt: readStringSafe(json, 'alt'),
        text: readStringSafe(json, 'text'),
      );
}
