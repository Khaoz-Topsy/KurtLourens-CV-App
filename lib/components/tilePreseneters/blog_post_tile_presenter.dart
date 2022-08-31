import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../contracts/cv_data_recent_blog_posts.dart';
import '../../helper/generic_helper.dart';
import '../common/on_hover_float.dart';

Widget blogPostGridTilePresenter(
  BuildContext context,
  CvDataRecentBlogPosts blogPosts,
) {
  Widget image = networkImage(
    blogPosts.imageUrl,
    height: 200,
    width: double.infinity,
    boxfit: BoxFit.cover,
    loading: getLoading().smallLoadingIndicator(),
  );
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: OnHoverFloat(
      content: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(4),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            image,
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                right: 4,
                left: 4,
                bottom: 12,
              ),
              child: Text(
                blogPosts.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  blogPosts.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: blogPosts.tags
                      .map((tag) => genericChip(context, tag))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => launchExternalURL(blogPosts.link),
    ),
  );
}
