import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../contracts/cv_data_work_experience.dart';
import '../../helper/image_helper.dart';
import '../common/chip_link.dart';
import '../common/text_span.dart';

class WorkExperienceBottomSheet extends StatelessWidget {
  final CvDataWorkExperience wExp;
  final ScrollController scrollController;
  const WorkExperienceBottomSheet(
    this.wExp,
    this.scrollController, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget Function()> widgets = [];

    widgets.add(
      () => LocalImage(
        imagePath: getCvIcon(wExp.image, wExp.darkModeImage, ''),
        boxfit: BoxFit.contain,
        height: 50,
      ),
    );
    widgets.add(() => const EmptySpace1x());
    widgets.add(() => GenericItemName(wExp.title));
    widgets.add(() => GenericItemGroup(wExp.company));
    widgets.add(() => const EmptySpace1x());
    widgets.add(() => GenericItemDescription(wExp.location));
    widgets.add(() => const EmptySpace1x());

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

    widgets.add(() => const EmptySpace1x());
    widgets.add(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: getTextSpanFromTemplateAndArray(
          context,
          wExp.content,
          textAlign: TextAlign.center,
        ),
      ),
    );

    widgets.add(() => const EmptySpace8x());

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widgets.length,
      itemBuilder: (_, int index) => widgets[index](),
      controller: scrollController,
    );
  }
}
