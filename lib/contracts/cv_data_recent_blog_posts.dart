// To parse this JSON data, do
//
//     final cvDataRecentBlogPosts = cvDataRecentBlogPostsFromJson(jsonString);

import 'dart:convert';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

class CvDataRecentBlogPosts {
  final String guid;
  final String link;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;

  CvDataRecentBlogPosts({
    required this.guid,
    required this.link,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
  });

  factory CvDataRecentBlogPosts.fromRawJson(String str) =>
      CvDataRecentBlogPosts.fromJson(json.decode(str));

  factory CvDataRecentBlogPosts.fromJson(Map<String, dynamic> json) =>
      CvDataRecentBlogPosts(
        guid: readStringSafe(json, 'guid'),
        link: readStringSafe(json, 'link'),
        title: readStringSafe(json, 'title'),
        description: readStringSafe(json, 'description'),
        imageUrl: readStringSafe(json, 'imageUrl'),
        tags: readListSafe(
          json,
          'tags',
          (jsonItem) => jsonItem.toString(),
        ),
      );
}
