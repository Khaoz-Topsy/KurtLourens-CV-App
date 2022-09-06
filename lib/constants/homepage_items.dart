import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../contracts/homepage_menu_item.dart';
import 'app_border.dart';
import 'app_image.dart';
import 'app_routes.dart';
import 'external_urls.dart';

List<HomepageMenuItem> getMenuOptionsSection1(
  BuildContext context,
  Color drawerIconColour,
) {
  //
  Widget localGetFromIcon(IconData icon) =>
      getCorrectlySizedImageFromIcon(context, icon,
          colour: drawerIconColour, maxSize: imageSize);

  return [
    HomepageMenuItem(
      image: localGetFromIcon(Icons.person),
      title: 'Web version',
      onTap: (_) => launchExternalURL(KurtExternalUrls.cvWebsite),
    ),
    HomepageMenuItem(
      image: localGetFromIcon(Icons.library_books),
      title: 'Personal Blog',
      onTap: (_) => launchExternalURL(KurtExternalUrls.personalBlog),
    ),
    HomepageMenuItem(
      image: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 35,
          maxHeight: 35,
        ),
        child: localImage(
          AppImage.assistantNMSIcon,
          borderRadius: defaultImageBorderRadius,
        ),
      ),
      title: 'Assistant for No Man\'s Sky',
      onTap: (_) => launchExternalURL(KurtExternalUrls.assistantNMSWeb),
    ),
    HomepageMenuItem(
      image: localGetFromIcon(Icons.person),
      title: 'CV Website',
      onTap: (buttonCtx) {
        getNavigation().pop(buttonCtx);
        getNavigation().navigateAwayFromHomeAsync(
          context,
          navigateToNamed: Routes.about,
        );
      },
    ),
  ];
}
