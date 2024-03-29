import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

import '../../components/common/loading.dart';
import '../../constants/app_image.dart';

class LoadingWidgetService implements ILoadingWidgetService {
  @override
  Widget smallLoadingIndicator() => const CustomSpinner();

  @override
  Widget smallLoadingTile(BuildContext context, {String? loadingText}) =>
      ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: smallLoadingIndicator(),
        ),
        title: Text(loadingText ?? 'Loading'),
      );

  @override
  Widget loadingIndicator({double height = 50.0}) => Container(
        alignment: const Alignment(0, 0),
        height: height,
        child: smallLoadingIndicator(),
      );

  @override
  Widget fullPageLoading(BuildContext context, {String? loadingText}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              smallLoadingIndicator(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(12),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(loadingText ?? 'Loading')],
          ),
        ],
      );

  @override
  Widget customErrorWidget(BuildContext context, {String? text}) {
    return Center(
      child: Column(
        children: [
          const LocalImage(
            imagePath: AppImage.error,
            width: 250,
            padding: EdgeInsets.all(8),
          ),
          Text(
            text ?? getTranslations().fromKey(LocaleKey.somethingWentWrong),
            style: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
