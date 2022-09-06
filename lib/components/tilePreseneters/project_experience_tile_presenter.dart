import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../constants/app_border.dart';
import '../../contracts/cv_data_project.dart';
import '../../contracts/cv_data_tech.dart';
import '../../helper/image_helper.dart';
import '../modalBottomSheet/project_modal_bottom_sheet.dart';
import 'experience_tile_presenter.dart';

Widget projectExperienceGridTilePresenter(
  BuildContext context,
  CvDataProject proj,
  CvDataTech techLookup,
) {
  return ExperienceGridTilePresenter(
    image: localImage(
      getCvIcon(proj.image, proj.darkModeImage, proj.imageTile),
      imageHero: proj.title,
      boxfit: BoxFit.fitHeight,
      borderRadius: defaultImageBorderRadius,
    ),
    title: proj.title,
    subtitle: proj.timePeriodText,
    onTap: () => adaptiveBottomModalSheet(
      context,
      hasRoundedCorners: true,
      builder: (BuildContext innerContext) => ProjectBottomSheet(
        proj,
        techLookup,
      ),
    ),
  );
}
