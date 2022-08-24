import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';
import 'package:breakpoint/breakpoint.dart';

import '../components/adaptive/homepage_appbar.dart';
import '../components/drawer.dart';
import '../components/scaffoldTemplates/generic_page_scaffold.dart';
import '../constants/app_image.dart';
import '../constants/homepage_items.dart';
import '../contracts/homepage_menu_item.dart';
import '../helper/column_helper.dart';

class Homepage extends StatelessWidget {
  final Color drawerIconColour = getTheme().getDarkModeSecondaryColour();
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return basicGenericPageScaffold(
      context,
      appBar: homePageAppBar('Home'),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BreakpointBuilder(
          builder: (BuildContext innerContext, Breakpoint breakpoint) {
            int numCols = getHomepageColumnCount(breakpoint);
            List<StaggeredGridItem> gridItems = getGridItems(
              innerContext,
              drawerIconColour,
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
      ),
    );
  }
}

List<StaggeredGridItem> getGridItems(
  BuildContext innerContext,
  Color drawerIconColour,
  int numCols,
) =>
    [
      StaggeredGridItem(
        childBuilder: (BuildContext childContext) => Card(
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
                children: [
                  const Text(
                    'Kurt Lourens',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'Senior Software Engineer',
                    maxLines: 2,
                  )
                ],
              )
            ],
          ),
        ),
        gridItemType: StaggeredTile.count((numCols - 2), 1.25),
      ),
      StaggeredGridItem(
        childBuilder: (BuildContext childContext) => const Card(
          child: Center(
            child: Icon(Icons.question_mark),
          ),
        ),
        gridItemType: const StaggeredTile.count(2, 1.25),
      ),
      StaggeredGridItem(
        childBuilder: (BuildContext childContext) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [genericItemName('Work Experience')],
        ),
        gridItemType: StaggeredTile.count(numCols, 0.5),
      ),
      ...(getMenuOptionsSection1(innerContext, drawerIconColour)
          .map(
            (menuItem) => StaggeredGridItem(
              childBuilder: (BuildContext childContext) =>
                  homepageMenuItemGridPresenter(childContext, menuItem),
              gridItemType: const StaggeredTile.count(8, 1),
            ),
          )
          .toList()),
    ];

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
