import 'package:breakpoint/breakpoint.dart';

int getHomepageColumnCount(Breakpoint breakpoint) {
  if (breakpoint.window == WindowSize.xsmall) return 6;
  if (breakpoint.window == WindowSize.small) return 8;
  if (breakpoint.window == WindowSize.medium) return 16;
  if (breakpoint.window == WindowSize.large) return 16;
  if (breakpoint.window == WindowSize.xlarge) return 24;

  return 4;
}

double getHomepageBlogPostColumnHeight(Breakpoint breakpoint) {
  if (breakpoint.window == WindowSize.xsmall) return 6;
  if (breakpoint.window == WindowSize.small) return 5;
  if (breakpoint.window == WindowSize.medium) return 6;
  if (breakpoint.window == WindowSize.large) return 5;
  if (breakpoint.window == WindowSize.xlarge) return 5;

  return 4;
}
