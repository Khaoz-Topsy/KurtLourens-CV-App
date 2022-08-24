import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

import 'cv_data_link.dart';

class CvDataWorkExperience {
  String title;
  String company;
  String icon;
  String image;
  String imageAlt;
  String darkModeImage;
  String timePeriodText;
  String timePeriodTextAlt;
  String timePeriodClass;
  String timePeriodColour;
  String timePeriodTextColour;
  String content;
  String contentHtml;
  String location;
  String pureHtml;
  List<CvDataLink> buttons;

  CvDataWorkExperience({
    required this.title,
    required this.company,
    required this.icon,
    required this.image,
    required this.imageAlt,
    required this.darkModeImage,
    required this.timePeriodText,
    required this.timePeriodTextAlt,
    required this.timePeriodClass,
    required this.timePeriodColour,
    required this.timePeriodTextColour,
    required this.content,
    required this.contentHtml,
    required this.location,
    required this.pureHtml,
    required this.buttons,
  });

  factory CvDataWorkExperience.fromRawJson(String str) =>
      CvDataWorkExperience.fromJson(json.decode(str));

  factory CvDataWorkExperience.fromJson(Map<String, dynamic> json) =>
      CvDataWorkExperience(
        title: readStringSafe(json, 'title'),
        company: readStringSafe(json, 'company'),
        icon: readStringSafe(json, 'icon'),
        image: readStringSafe(json, 'image'),
        imageAlt: readStringSafe(json, 'imageAlt'),
        darkModeImage: readStringSafe(json, 'darkModeImage'),
        timePeriodText: readStringSafe(json, 'timePeriodText'),
        timePeriodTextAlt: readStringSafe(json, 'timePeriodTextAlt'),
        timePeriodClass: readStringSafe(json, 'timePeriodClass'),
        timePeriodColour: readStringSafe(json, 'timePeriodColour'),
        timePeriodTextColour: readStringSafe(json, 'timePeriodTextColour'),
        content: readStringSafe(json, 'content'),
        contentHtml: readStringSafe(json, 'contentHtml'),
        location: readStringSafe(json, 'location'),
        pureHtml: readStringSafe(json, 'pureHtml'),
        buttons: readListSafe(
          json,
          'buttons',
          (jsonItem) => CvDataLink.fromJson(jsonItem),
        ),
      );
}
