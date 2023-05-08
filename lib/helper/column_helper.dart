import 'package:breakpoint/breakpoint.dart';

int getHomepageColumnCount(Breakpoint breakpoint) {
  if (breakpoint.window == WindowSize.xsmall) return 4;
  if (breakpoint.window == WindowSize.small) return 4;
  if (breakpoint.window == WindowSize.medium) return 4;
  if (breakpoint.window == WindowSize.large) return 8;
  if (breakpoint.window == WindowSize.xlarge) return 8;

  return 4;
}

int getHomepageBlogPostColumnHeight(Breakpoint breakpoint) {
  if (breakpoint.window == WindowSize.xsmall) return 6;
  if (breakpoint.window == WindowSize.small) return 5;
  if (breakpoint.window == WindowSize.medium) return 6;
  if (breakpoint.window == WindowSize.large) return 5;
  if (breakpoint.window == WindowSize.xlarge) return 5;

  return 4;
}
