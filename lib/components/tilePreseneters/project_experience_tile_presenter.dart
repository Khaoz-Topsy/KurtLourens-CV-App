import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../contracts/cv_data_project.dart';
import '../../helper/image_helper.dart';
import 'experience_tile_presenter.dart';

Widget projectExperienceGridTilePresenter(CvDataProject wExp) {
  return experienceGridTilePresenter(
    image: localImage(
      getCvIcon(wExp.image, wExp.darkModeImage, wExp.imageTile),
      boxfit: BoxFit.fitHeight,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(4),
        bottomLeft: Radius.circular(4),
      ),
    ),
    title: wExp.title,
    subtitle: wExp.timePeriodText,
    onTap: () {},
  );
}
