import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_duration.dart';
import '../../constants/app_image.dart';
import '../../constants/app_modal.dart';
import '../../contracts/cv_data_project.dart';
import '../../contracts/cv_data_tech.dart';
import '../../contracts/cv_data_tech_used.dart';
import '../../helper/image_helper.dart';
import '../common/chip_link.dart';
import '../common/text_span.dart';

class ProjectBottomSheet extends StatelessWidget {
  final CvDataProject proj;
  final CvDataTech techLookup;
  const ProjectBottomSheet(this.proj, this.techLookup, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget Function()> widgets = [];

    widgets.add(
      () => localImage(
        getCvIcon(proj.image, proj.darkModeImage, ''),
        imageHero: proj.title,
        boxfit: BoxFit.contain,
        height: 50,
      ),
    );
    widgets.add(() => emptySpace1x());
    widgets.add(() => genericItemName(proj.title));

    widgets.add(
      () => Wrap(
        alignment: WrapAlignment.center,
        spacing: 4,
        children: [
          chipLink(
            context,
            label: proj.timePeriodText,
            foregroundColor: HexColor(proj.timePeriodTextColour),
            backgroundColor: HexColor(proj.timePeriodColour),
          ),
        ],
      ),
    );
    widgets.add(() => customDivider());

    if (proj.location.length > 2) {
      widgets.add(() => genericItemGroup(proj.location));
    }

    if (proj.links.isNotEmpty) {
      widgets.add(
        () => Wrap(
          alignment: WrapAlignment.center,
          spacing: 4,
          children: proj.links
              .map(
                (link) => chipLink(
                  context,
                  label: link.text,
                  externalUrl: link.url,
                ),
              )
              .toList(),
        ),
      );
    }
    widgets.add(() => emptySpace1x());
    widgets.add(() => getTextSpanFromTemplateAndArray(context, proj.content));
    widgets.add(() => emptySpace1x());
    widgets.add(() => customDivider());

    if (proj.techUsed.isNotEmpty) {
      widgets.add(() => emptySpace2x());
      widgets.add(() => genericItemGroup('Technologies used'));
      for (CvDataTechUsed techUsed in proj.techUsed) {
        CvDataTechItem? techIcon = techLookup.techs[techUsed.id];
        if (techIcon == null) continue;

        widgets.add(
          () => ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: (techIcon.img.contains('.svg'))
                  ? SvgPicture.asset('${AppImage.techFolder}${techIcon.img}')
                  : localImage('tech/${techIcon.img}'),
            ),
            title: Text(techIcon.name),
            subtitle: Text(
              techUsed.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }
    }

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
