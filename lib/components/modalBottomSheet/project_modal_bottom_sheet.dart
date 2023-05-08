import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_border.dart';
import '../../constants/app_image.dart';
import '../../contracts/cv_data_project.dart';
import '../../contracts/cv_data_tech.dart';
import '../../contracts/cv_data_tech_used.dart';
import '../../helper/image_helper.dart';
import '../common/chip_link.dart';
import '../common/text_span.dart';

class ProjectBottomSheet extends StatelessWidget {
  final CvDataProject proj;
  final CvDataTech techLookup;
  final ScrollController scrollController;
  const ProjectBottomSheet(
    this.proj,
    this.techLookup,
    this.scrollController, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget Function()> widgets = [];

    widgets.add(
      () => Center(
        child: LocalImage(
          imagePath: getCvIcon(proj.image, proj.darkModeImage, proj.imageTile),
          borderRadius: defaultImageBorderRadius,
          boxfit: BoxFit.contain,
          height: 50,
        ),
      ),
    );
    widgets.add(() => const EmptySpace1x());
    widgets.add(() => GenericItemName(proj.title));

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
      widgets.add(() => GenericItemGroup(proj.location));
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
    widgets.add(() => const EmptySpace1x());
    widgets.add(
      () => getTextSpanFromTemplateAndArray(
        context,
        proj.content,
        textAlign: TextAlign.center,
      ),
    );
    widgets.add(() => const EmptySpace1x());
    widgets.add(() => customDivider());

    if (proj.techUsed.isNotEmpty) {
      widgets.add(() => const EmptySpace2x());
      widgets.add(() => const GenericItemGroup('Technologies used'));
      for (CvDataTechUsed techUsed in proj.techUsed) {
        CvDataTechItem? techIcon = techLookup.techs[techUsed.id];
        if (techIcon == null) continue;

        var techImage = (techIcon.img.contains('.svg'))
            ? SvgPicture.asset('${AppImage.techFolder}${techIcon.img}')
            : LocalImage(imagePath: 'tech/${techIcon.img}');
        widgets.add(
          () => ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: techImage,
            ),
            title: Text(techIcon.name),
            subtitle: Text(
              techUsed.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const EmptySpace1x(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 100,
                          maxWidth: 100,
                        ),
                        child: techImage,
                      ),
                      const EmptySpace1x(),
                      Text(
                        techIcon.name,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const EmptySpace2x(),
                      Text(
                        techUsed.description,
                        maxLines: 100,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    }

    widgets.add(() => const EmptySpace8x());

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widgets.length,
      itemBuilder: (_, int index) => widgets[index](),
      controller: scrollController,
    );
  }
}
