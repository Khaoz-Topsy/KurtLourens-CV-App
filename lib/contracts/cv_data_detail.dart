import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

import 'cv_data_social_link.dart';

class CvDetail {
  final String image;
  final List<String> descriptions;
  final List<CvDataSocialLink> socialLinks;

  CvDetail({
    required this.image,
    required this.descriptions,
    required this.socialLinks,
  });

  factory CvDetail.fromRawJson(String str) =>
      CvDetail.fromJson(json.decode(str));

  factory CvDetail.fromJson(Map<String, dynamic> json) => CvDetail(
        image: readStringSafe(json, 'image'),
        descriptions: readListSafe(
          json,
          'descriptions',
          (jsonItem) => jsonItem,
        ),
        socialLinks: readListSafe(
          json,
          'socialLinks',
          (jsonItem) => CvDataSocialLink.fromJson(jsonItem),
        ),
      );
}
