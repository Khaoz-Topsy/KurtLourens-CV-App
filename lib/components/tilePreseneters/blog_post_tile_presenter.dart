import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../constants/app_border.dart';
import '../../contracts/cv_data_recent_blog_posts.dart';
import '../../helper/generic_helper.dart';

Widget blogPostGridTilePresenter(
  BuildContext context,
  CvDataRecentBlogPosts blogPosts,
) {
  Widget image = ImageFromNetwork(
    imageUrl: blogPosts.imageUrl,
    boxfit: BoxFit.cover,
    loading: getLoading().smallLoadingIndicator(),
  );
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(4),
      shape: defaultCardBorderShape,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: ClipRRect(
              borderRadius: defaultImageBorderRadius,
              child: image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              blogPosts.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 12,
            ),
            child: Text(
              blogPosts.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: blogPosts.tags
                  .map((tag) => genericChip(context, tag))
                  .toList(),
            ),
          ),
        ],
      ),
      // onTap: () => launchExternalURL(blogPosts.link),
    ),
  );
}
