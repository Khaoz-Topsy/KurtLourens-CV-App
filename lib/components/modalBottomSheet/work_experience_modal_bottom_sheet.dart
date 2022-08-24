import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../constants/app_duration.dart';
import '../../contracts/cv_data_work_experience.dart';
import '../../helper/image_helper.dart';

class WorkExperienceBottomSheet extends StatelessWidget {
  final CvDataWorkExperience wExp;
  const WorkExperienceBottomSheet(this.wExp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget Function()> widgets = [];

    widgets.add(
      () => localImage(
        getCvIcon(wExp.image, wExp.darkModeImage, ''),
      ),
    );
    widgets.add(() => genericItemName(wExp.title));
    widgets.add(() => genericItemGroup(wExp.company));
    widgets.add(() => emptySpace1x());
    widgets.add(() => genericItemDescription(wExp.content));

    widgets.add(() => emptySpace8x());

    return AnimatedSize(
      duration: AppDuration.modal,
      child: Container(
        constraints: BoxConstraints(
          minHeight: (MediaQuery.of(context).size.height) / 2,
          maxHeight: (MediaQuery.of(context).size.height) * 0.9,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: widgets.length,
          itemBuilder: (_, int index) => widgets[index](),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
