import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../components/adaptive/homepage_appbar.dart';
import '../components/drawer.dart';
import '../components/scaffoldTemplates/generic_page_scaffold.dart';
import '../components/tilePreseneters/blog_post_tile_presenter.dart';
import '../components/tilePreseneters/project_experience_tile_presenter.dart';
import '../components/tilePreseneters/work_experience_tile_presenter.dart';
import '../constants/app_border.dart';
import '../constants/app_image.dart';
import '../constants/app_routes.dart';
import '../contracts/cv_data.dart';
import '../services/json/cv_data_json_repository.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return basicGenericPageScaffold(
      context,
      appBar: homePageAppBar('Home'),
      drawer: const AppDrawer(),
      body: CachedFutureBuilder<ResultWithValue<CvData>>(
        key: const Key('home-page'),
        future: (CvDataJsonRepository()).getCVData(context),
        whileLoading: () => const Center(),
        whenDoneLoading: (ResultWithValue<CvData> result) {
          var items = getGridItems(
            context,
            result.value,
            getTheme().getDarkModeSecondaryColour(),
          );
          return animateWidgetIn(
            child: SearchableList<Widget>(
              () => Future.value(ResultWithValue(true, items, '')),
              listItemWithIndexDisplayer:
                  (_, widg, __, {void Function()? onTap}) => widg,
              listItemSearch: (_, __) => false,
              // gridViewColumnCalculator: steamNewsCustomColumnCount,
              minListForSearch: 20000,
            ),
          );
          // return SingleChildScrollView(
          //   child: ResponsiveStaggeredGrid(
          //     // items: getGridItems(
          //     //   context,
          //     //   result.value,
          //     //   getTheme().getDarkModeSecondaryColour(),
          //     //   2,
          //     //   4,
          //     // ),
          //     items: [],
          //   ),
          // );
        },
      ),
    );
  }
}

List<Widget> getGridItems(
  BuildContext innerContext,
  CvData cvData,
  Color drawerIconColour,
) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Card(
        shape: defaultCardBorderShape,
        margin: const EdgeInsets.only(top: 16.0),
        child: InkWell(
          borderRadius: defaultImageBorderRadius,
          onTap: () => getNavigation().navigateAwayFromHomeAsync(
            innerContext,
            navigateToNamed: Routes.about,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 60,
                child: LocalImage(
                  imagePath: AppImage.avatar,
                  borderRadius: defaultCardBorderRadiusLeft,
                ),
              ),
              const EmptySpace(2),
              const Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kurt Lourens',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Senior Software Engineer', maxLines: 1)
                  ],
                ),
              ),
              const Center(child: Icon(Icons.question_mark)),
              const EmptySpace3x(),
            ],
          ),
        ),
      ),
    ),
    const EmptySpace1x(),
    sectionHeading('Work Experience'),
    ...(cvData.workExperiences
        .map(
          (cvItem) => workExperienceGridTilePresenter(innerContext, cvItem),
        )
        .toList()),
    const EmptySpace1x(),
    sectionHeading('Projects'),
    ...(cvData.projects
        .map(
          (cvItem) => projectExperienceGridTilePresenter(
            innerContext,
            cvItem,
            cvData.tech,
          ),
        )
        .toList()),
    const EmptySpace1x(),
    sectionHeading('Latest Blog posts'),
    ...(cvData.blogPosts
        .map(
          (blogPost) => blogPostGridTilePresenter(
            innerContext,
            blogPost,
          ),
        )
        .toList()),
    const EmptySpace8x(),
  ];
}

Widget sectionHeading(String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [GenericItemName(title)],
  );
}
