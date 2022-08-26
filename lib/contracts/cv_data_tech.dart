import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

class CvDataTech {
  final Map<String, CvDataTechItem> techs;

  CvDataTech({
    required this.techs,
  });

  factory CvDataTech.fromRawJson(String str) =>
      CvDataTech.fromJson(json.decode(str));

  factory CvDataTech.fromJson(Map<String, dynamic>? json) {
    Map<String, CvDataTechItem> localTechs = <String, CvDataTechItem>{};
    if (json != null) {
      for (String jsonKey in json.keys) {
        var jsonValue = json[jsonKey];
        localTechs.putIfAbsent(
          jsonKey,
          () => CvDataTechItem.fromJson(jsonValue),
        );
      }
    }
    return CvDataTech(
      techs: localTechs,
    );
  }
}

class CvDataTechItem {
  final String name;
  final String img;

  CvDataTechItem({
    required this.name,
    required this.img,
  });

  factory CvDataTechItem.fromRawJson(String str) =>
      CvDataTechItem.fromJson(json.decode(str));

  factory CvDataTechItem.fromJson(Map<String, dynamic> json) => CvDataTechItem(
        name: readStringSafe(json, 'name'),
        img: readStringSafe(json, 'img'),
      );
}
