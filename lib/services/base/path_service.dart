import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../constants/app_image.dart';

class PathService implements IPathService {
  final String imageAssetPath;

  PathService({
    this.imageAssetPath = 'assets/images',
  });

  @override
  String get imageAssetPathPrefix => AppImage.imageAssetPathPrefix;
  @override
  Widget get steamNewsDefaultImage =>
      LocalImage(imagePath: '$imageAssetPathPrefix/defaultSteamNews.jpg');
  @override
  String get defaultProfilePic => '';
  @override
  String get unknownImagePath => AppImage.unknown;

  @override
  String get defaultGuideImage => AppImage.unknown;

  @override
  String ofImage(String imagePartialPath) {
    if (imagePartialPath.contains(imageAssetPath)) {
      return imagePartialPath;
    }

    return '$imageAssetPath/$imagePartialPath';
  }
}
