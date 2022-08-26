import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../constants/app_duration.dart';
import '../../constants/app_modal.dart';
import '../../contracts/cv_data_work_experience.dart';
import '../../helper/image_helper.dart';
import '../common/chip_link.dart';
import '../common/text_span.dart';

class WorkExperienceBottomSheet extends StatelessWidget {
  final CvDataWorkExperience wExp;
  const WorkExperienceBottomSheet(this.wExp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget Function()> widgets = [];

    widgets.add(
      () => localImage(
        getCvIcon(wExp.image, wExp.darkModeImage, ''),
        boxfit: BoxFit.contain,
        height: 50,
      ),
    );
    widgets.add(() => emptySpace1x());
    widgets.add(() => genericItemName(wExp.title));
    widgets.add(() => genericItemGroup(wExp.company));
    widgets.add(() => emptySpace1x());
    widgets.add(() => genericItemDescription(wExp.location));
    widgets.add(() => emptySpace1x());

    widgets.add(
      () => Wrap(
        alignment: WrapAlignment.center,
        spacing: 4,
        children: [
          chipLink(
            context,
            label: wExp.timePeriodText,
            foregroundColor: HexColor(wExp.timePeriodTextColour),
            backgroundColor: HexColor(wExp.timePeriodColour),
          ),
        ],
      ),
    );
    widgets.add(() => customDivider());

    widgets.add(() => emptySpace1x());
    widgets.add(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: getTextSpanFromTemplateAndArray(context, wExp.content),
      ),
    );

    widgets.add(() => emptySpace8x());

    return AnimatedSize(
      duration: AppDuration.modal,
      child: animateWidgetIn(
        duration: AppDuration.modal,
        child: Container(
          constraints: modalDefaultSize(context),
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: widgets.length,
            itemBuilder: (_, int index) => widgets[index](),
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}
