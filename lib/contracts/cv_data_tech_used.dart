import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

class CvDataTechUsed {
  String id;
  String description;

  CvDataTechUsed({
    required this.id,
    required this.description,
  });

  factory CvDataTechUsed.fromRawJson(String str) =>
      CvDataTechUsed.fromJson(json.decode(str));

  factory CvDataTechUsed.fromJson(Map<String, dynamic> json) => CvDataTechUsed(
        id: readStringSafe(json, 'id'),
        description: readStringSafe(json, 'description'),
      );
}
