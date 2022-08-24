import 'package:breakpoint/breakpoint.dart';

int getHomepageColumnCount(Breakpoint breakpoint) {
  if (breakpoint.window == WindowSize.xsmall) return 8;
  if (breakpoint.window == WindowSize.small) return 12;
  if (breakpoint.window == WindowSize.medium) return 16;
  if (breakpoint.window == WindowSize.large) return 16;
  if (breakpoint.window == WindowSize.xlarge) return 16;

  return 4;
}
