import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';
import 'package:breakpoint/breakpoint.dart';

import '../components/adaptive/homepage_appbar.dart';
import '../components/drawer.dart';
import '../components/scaffoldTemplates/generic_page_scaffold.dart';
import '../constants/app_image.dart';
import '../constants/app_routes.dart';
import '../constants/homepage_items.dart';
import '../constants/staggered_grid_item_type.dart';
import '../contracts/homepage_menu_item.dart';
import '../helper/column_helper.dart';

class Homepage extends StatelessWidget {
  final Color drawerIconColour = getTheme().getDarkModeSecondaryColour();
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allItems = [
      ...getMenuOptionsSection1(
        context,
        drawerIconColour,
      ),
    ];

    var gridItems = [
      StaggeredGridItem(
        childBuilder: (BuildContext childContext) =>
            homepageMenuItemGridPresenter(
          context,
          HomepageMenuItem(
            image: getListTileImage(AppImage.windowIcon, size: imageSize),
            title: 'Test',
            navigateToNamed: Routes.home,
          ),
        ),
        gridItemType: StaggeredGridItemType.smallRectLandscapeXLong,
      ),
      ...(allItems
          .map(
            (menuItem) => StaggeredGridItem(
              childBuilder: (BuildContext childContext) =>
                  homepageMenuItemGridPresenter(context, menuItem),
              gridItemType: const StaggeredTile.count(8, 1),
            ),
          )
          .toList()),
    ];

    return basicGenericPageScaffold(
      context,
      appBar: homePageAppBar('Home'),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BreakpointBuilder(
          builder: (BuildContext innerContext, Breakpoint breakpoint) {
            int numCols = getHomepageColumnCount(breakpoint);
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
      ),
    );
  }
}

Widget homepageMenuItemGridPresenter(
  BuildContext context,
  HomepageMenuItem menuItem,
) {
  Widget card = GestureDetector(
    child: Card(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            menuItem.image,
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                menuItem.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
          ],
        ),
      ],
    )),
    // onTap: () => customMenuClickHandler(context, menuItem),
  );
  return card;
}
