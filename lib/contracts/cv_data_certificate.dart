import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

import 'cv_data_link.dart';

class CvDataCertificate {
  bool isAward;
  String title;
  String image;
  String imageAlt;
  String timePeriodText;
  String timePeriodClass;
  String content;
  String location;
  List<CvDataLink> buttons;

  CvDataCertificate({
    required this.isAward,
    required this.title,
    required this.image,
    required this.imageAlt,
    required this.timePeriodText,
    required this.timePeriodClass,
    required this.content,
    required this.location,
    required this.buttons,
  });

  factory CvDataCertificate.fromRawJson(String str) =>
      CvDataCertificate.fromJson(json.decode(str));

  factory CvDataCertificate.fromJson(Map<String, dynamic> json) =>
      CvDataCertificate(
        isAward: readBoolSafe(json, 'isAward'),
        title: readStringSafe(json, 'title'),
        image: readStringSafe(json, 'image'),
        imageAlt: readStringSafe(json, 'imageAlt'),
        timePeriodText: readStringSafe(json, 'timePeriodText'),
        timePeriodClass: readStringSafe(json, 'timePeriodClass'),
        content: readStringSafe(json, 'content'),
        location: readStringSafe(json, 'location'),
        buttons: readListSafe(
          json,
          'buttons',
          (jsonItem) => CvDataLink.fromJson(jsonItem),
        ),
      );
}
