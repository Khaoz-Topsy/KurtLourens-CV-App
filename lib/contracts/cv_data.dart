// To parse this JSON data, do
//
//     final cvData = cvDataFromJson(jsonString);

import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

import 'cv_data_detail.dart';
import 'cv_data_certificate.dart';
import 'cv_data_project.dart';
import 'cv_data_recent_blog_posts.dart';
import 'cv_data_tech.dart';
import 'cv_data_work_experience.dart';

class CvData {
  CvDetail details;
  List<CvDataWorkExperience> workExperiences;
  List<CvDataCertificate> certificates;
  List<CvDataProject> projects;
  List<CvDataRecentBlogPosts> blogPosts;
  CvDataTech tech;

  CvData({
    required this.details,
    required this.workExperiences,
    required this.certificates,
    required this.projects,
    required this.blogPosts,
    required this.tech,
  });

  factory CvData.fromRawJson(String str) => CvData.fromJson(json.decode(str));

  factory CvData.fromJson(Map<String, dynamic> json) => CvData(
        details: CvDetail.fromJson(json["details"]),
        workExperiences: readListSafe(
          json,
          'workExperiences',
          (jsonItem) => CvDataWorkExperience.fromJson(jsonItem),
        ),
        certificates: readListSafe(
          json,
          'certificates',
          (jsonItem) => CvDataCertificate.fromJson(jsonItem),
        ),
        projects: readListSafe(
          json,
          'projects',
          (jsonItem) => CvDataProject.fromJson(jsonItem),
        ),
        blogPosts: readListSafe(
          json,
          'recentBlogPosts',
          (jsonItem) => CvDataRecentBlogPosts.fromJson(jsonItem),
        ),
        tech: CvDataTech.fromJson(json['tech']),
      );
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
