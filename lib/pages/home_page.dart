import 'dart:math';

import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kurt_lourens_cv/constants/app_routes.dart';

import '../components/adaptive/homepage_appbar.dart';
import '../components/common/cached_future_builder.dart';
import '../components/drawer.dart';
import '../components/scaffoldTemplates/generic_page_scaffold.dart';
import '../components/tilePreseneters/blog_post_tile_presenter.dart';
import '../components/tilePreseneters/project_experience_tile_presenter.dart';
import '../components/tilePreseneters/work_experience_tile_presenter.dart';
import '../constants/app_image.dart';
import '../contracts/cv_data.dart';
import '../helper/column_helper.dart';
import '../services/json/cv_data_json_repository.dart';

class Homepage extends StatelessWidget {
  final Color drawerIconColour = getTheme().getDarkModeSecondaryColour();
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return basicGenericPageScaffold(
      context,
      appBar: homePageAppBar('Home'),
      drawer: const AppDrawer(),
      body: CachedFutureBuilder<ResultWithValue<CvData>>(
        key: const Key('home-page'),
        future: (CvDataJsonRepository()).getCVData(context),
        whileLoading: const Center(),
        whenDoneLoading: (ResultWithValue<CvData> result) {
          return animateWidgetIn(
            child: BreakpointBuilder(
              builder: (BuildContext innerContext, Breakpoint breakpoint) {
                int numCols = getHomepageColumnCount(breakpoint);
                double blogPostHeight =
                    getHomepageBlogPostColumnHeight(breakpoint);
                List<StaggeredGridItem> gridItems = getGridItems(
                  innerContext,
                  result.value,
                  drawerIconColour,
                  blogPostHeight,
                  numCols,
                );

                return StaggeredGridView.countBuilder(
                  key: Key("staggeredGrid-col-$numCols"),
                  crossAxisCount: numCols,
                  itemCount: gridItems.length,
                  itemBuilder: (BuildContext itemContext, int index) =>
                      gridItems[index].childBuilder!(itemContext),
                  staggeredTileBuilder: (int index) =>
                      gridItems[index].gridItemType,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

List<StaggeredGridItem> getGridItems(
  BuildContext innerContext,
  CvData cvData,
  Color drawerIconColour,
  double blogPostHeight,
  int numCols,
) {
  const topHeadingHelpWidth = 2;
  const topHeadingHeight = 1.25;
  const mainListItemDefaultWidth = 8;
  int mainListItemWidth = min(mainListItemDefaultWidth, numCols);
  StaggeredTile mainListItemGridType =
      StaggeredTile.count(mainListItemWidth, 1.3);
  double sectionHeadingHeight = (blogPostHeight / 10.0) + 0.3;

  return [
    StaggeredGridItem(
      childBuilder: (BuildContext childContext) => Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 2.0),
        child: Card(
          margin: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              localImage(
                AppImage.avatar,
                boxfit: BoxFit.fitHeight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              emptySpace(2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Kurt Lourens',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Senior Software Engineer',
                    maxLines: 2,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      gridItemType: StaggeredTile.count(
        (numCols - topHeadingHelpWidth),
        topHeadingHeight,
      ),
    ),
    StaggeredGridItem(
      childBuilder: (BuildContext childContext) => Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 12.0),
        child: Card(
          margin: const EdgeInsets.only(top: 16.0),
          child: InkWell(
            onTap: () => getNavigation().navigateAwayFromHomeAsync(
              childContext,
              navigateToNamed: Routes.about,
            ),
            child: const Center(
              child: Icon(Icons.question_mark),
            ),
          ),
        ),
      ),
      gridItemType: const StaggeredTile.count(
        topHeadingHelpWidth,
        topHeadingHeight,
      ),
    ),
    //
    sectionHeading('Work Experience', numCols, sectionHeadingHeight),
    ...(cvData.workExperiences
        .map(
          (cvItem) => StaggeredGridItem(
            childBuilder: (BuildContext childContext) =>
                workExperienceGridTilePresenter(childContext, cvItem),
            gridItemType: mainListItemGridType,
          ),
        )
        .toList()),
    //
    sectionHeading('Projects', numCols, sectionHeadingHeight),
    ...(cvData.projects
        .map(
          (cvItem) => StaggeredGridItem(
            childBuilder: (BuildContext childContext) =>
                projectExperienceGridTilePresenter(
              childContext,
              cvItem,
              cvData.tech,
            ),
            gridItemType: mainListItemGridType,
          ),
        )
        .toList()),
    //
    sectionHeading('Latest Blog posts', numCols, sectionHeadingHeight),
    ...(cvData.blogPosts
        .map(
          (blogPost) => StaggeredGridItem(
            childBuilder: (BuildContext childContext) =>
                blogPostGridTilePresenter(
              childContext,
              blogPost,
            ),
            gridItemType: StaggeredTile.count(8, blogPostHeight),
          ),
        )
        .toList()),
    //
    StaggeredGridItem(
      childBuilder: (BuildContext childContext) => emptySpace1x(),
      gridItemType: StaggeredTile.count(numCols, 2),
    ),
  ];
}

StaggeredGridItem sectionHeading(String title, int numCols, double height) {
  return StaggeredGridItem(
    childBuilder: (BuildContext childContext) => Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [genericItemName(title)],
    ),
    gridItemType: StaggeredTile.count(numCols, height),
  );
}
