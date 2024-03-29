import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';
import 'package:kurt_lourens_cv/contracts/cv_data_detail.dart';

import '../../constants/app_image.dart';
import '../components/adaptive/homepage_appbar.dart';
import '../components/common/chip_link.dart';
import '../components/common/text_span.dart';
import '../components/scaffoldTemplates/generic_page_scaffold.dart';
import '../constants/app_border.dart';
import '../contracts/cv_data.dart';
import '../services/json/cv_data_json_repository.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return basicGenericPageScaffold(
      context,
      appBar: homePageAppBar('About'),
      body: CachedFutureBuilder<ResultWithValue<CvData>>(
        key: const Key('home-page'),
        future: (CvDataJsonRepository()).getCVData(context),
        whileLoading: () => const Center(),
        whenDoneLoading: (ResultWithValue<CvData> result) {
          CvDetail details = result.value.details;
          List<Widget Function()> widgets = [];

          widgets.add(
            () => Center(
              child: LocalImage(
                imagePath: AppImage.avatar,
                boxfit: BoxFit.fitHeight,
                height: 100,
                borderRadius: defaultImageBorderRadius,
              ),
            ),
          );
          widgets.add(() => const EmptySpace2x());

          for (String descriptor in details.descriptions) {
            widgets.add(
              () => Text(
                descriptor,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(fontSize: 16),
              ),
            );
          }
          widgets.add(() => const EmptySpace1x());
          widgets.add(() => customDivider());
          widgets.add(() => const EmptySpace1x());
          widgets.add(
            () => getTextSpanFromTemplateAndArray(
              context,
              details.intro,
              textAlign: TextAlign.center,
            ),
          );
          widgets.add(() => const EmptySpace1x());
          widgets.add(
            () => getTextSpanFromTemplateAndArray(
              context,
              details.postScript,
              textAlign: TextAlign.center,
            ),
          );
          widgets.add(() => const EmptySpace1x());
          widgets.add(() => customDivider());

          if (details.socialLinks.isNotEmpty) {
            widgets.add(() => const EmptySpace2x());
            widgets.add(() => const GenericItemGroup('Links'));
            widgets.add(
              () => Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                children: details.socialLinks
                    .map(
                      (link) => chipLink(
                        context,
                        label: link.title,
                        externalUrl: link.link,
                      ),
                    )
                    .toList(),
              ),
            );
          }

          widgets.add(() => const EmptySpace8x());

          return animateWidgetIn(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: widgets.length,
                itemBuilder: (_, int index) => widgets[index](),
                shrinkWrap: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
