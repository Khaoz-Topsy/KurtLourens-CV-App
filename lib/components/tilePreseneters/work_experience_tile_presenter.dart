import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../contracts/cv_data_work_experience.dart';
import '../../helper/image_helper.dart';
import '../modalBottomSheet/work_experience_modal_bottom_sheet.dart';
import 'experience_tile_presenter.dart';

Widget workExperienceGridTilePresenter(
  BuildContext context,
  CvDataWorkExperience wExp,
) {
  return experienceGridTilePresenter(
    image: Padding(
      padding: const EdgeInsets.only(left: 4),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 100),
        child: localImage(
          getCvIcon(wExp.image, wExp.darkModeImage, ''),
          boxfit: BoxFit.fitHeight,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    ),
    title: wExp.title,
    subtitle: wExp.company,
    onTap: () => adaptiveBottomModalSheet(
      context,
      hasRoundedCorners: true,
      builder: (BuildContext innerContext) => WorkExperienceBottomSheet(wExp),
    ),
  );
}
