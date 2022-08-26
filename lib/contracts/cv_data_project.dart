import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

import 'cv_data_link.dart';
import 'cv_data_tech_used.dart';

class CvDataProject {
  String title;
  String image;
  String imageTile;
  String imageAlt;
  String timePeriodText;
  String timePeriodTextAlt;
  String timePeriodClass;
  String timePeriodColour;
  String timePeriodTextColour;
  String content;
  List<CvDataLink> links;
  List<CvDataTechUsed> techUsed;
  String darkModeImage;
  String location;
  String contentHtml;

  CvDataProject({
    required this.title,
    required this.image,
    required this.imageTile,
    required this.imageAlt,
    required this.timePeriodText,
    required this.timePeriodTextAlt,
    required this.timePeriodClass,
    required this.timePeriodColour,
    required this.timePeriodTextColour,
    required this.content,
    required this.links,
    required this.techUsed,
    required this.darkModeImage,
    required this.location,
    required this.contentHtml,
  });

  factory CvDataProject.fromRawJson(String str) =>
      CvDataProject.fromJson(json.decode(str));

  factory CvDataProject.fromJson(Map<String, dynamic> json) => CvDataProject(
        title: readStringSafe(json, 'title'),
        image: readStringSafe(json, 'image'),
        imageTile: readStringSafe(json, 'imageTile'),
        imageAlt: readStringSafe(json, 'imageAlt'),
        timePeriodText: readStringSafe(json, 'timePeriodText'),
        timePeriodTextAlt: readStringSafe(json, 'timePeriodTextAlt'),
        timePeriodClass: readStringSafe(json, 'timePeriodClass'),
        timePeriodColour: readStringSafe(json, 'timePeriodColour'),
        timePeriodTextColour: readStringSafe(json, 'timePeriodTextColour'),
        content: readStringSafe(json, 'content'),
        links: readListSafe(
          json,
          'links',
          (jsonItem) => CvDataLink.fromJson(jsonItem),
        ),
        techUsed: readListSafe(
          json,
          'techUsed',
          (jsonItem) => CvDataTechUsed.fromJson(jsonItem),
        ),
        darkModeImage: readStringSafe(json, 'darkModeImage'),
        location: readStringSafe(json, 'location'),
        contentHtml: readStringSafe(json, 'contentHtml'),
      );
}
