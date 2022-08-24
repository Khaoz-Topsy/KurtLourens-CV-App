import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridItemType {
  static StaggeredTile smallSquare = const StaggeredTile.count(2, 2);
  static StaggeredTile smallRectLandscape = const StaggeredTile.count(4, 2);
  static StaggeredTile smallRectPortrait = const StaggeredTile.count(2, 4);
  static StaggeredTile smallRectLandscapeLong = const StaggeredTile.count(6, 2);
  static StaggeredTile smallRectLandscapeXLong =
      const StaggeredTile.count(8, 2);

  static StaggeredTile medSquare = const StaggeredTile.count(4, 4);
  static StaggeredTile medRectLandscape = const StaggeredTile.count(6, 4);
  static StaggeredTile medRectPortrait = const StaggeredTile.count(4, 6);

  static StaggeredTile largeSquare = const StaggeredTile.count(6, 6);
  static StaggeredTile largeRectLandscape = const StaggeredTile.count(8, 6);
  static StaggeredTile largeRectPortrait = const StaggeredTile.count(6, 8);
}
