import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

Widget getTextSpanFromTemplateAndArray(
  BuildContext context,
  String origContent, {
  int? maxLines,
  TextOverflow? overflow,
}) {
  TextStyle defaultStyle = Theme.of(context).textTheme.bodyText1!;
  List<String> templateArray = origContent.split(' ');

  List<TextSpan> textSpans = List.empty(growable: true);
  for (int templateVariableIndex = 0;
      templateVariableIndex < templateArray.length;
      templateVariableIndex++) {
    Map<String, TextSpan> shortCodeMapObj = shortCodeMap(defaultStyle);
    textSpans.add(shortCodesHandler(
      context,
      templateArray[templateVariableIndex],
      shortCodeMapObj,
    ));
    textSpans.add(const TextSpan(text: ' '));
  }

  return RichText(
    text: TextSpan(
      style: Theme.of(context).textTheme.bodyText1,
      children: textSpans,
    ),
    textAlign: TextAlign.left,
    maxLines: maxLines ?? 9999,
    overflow: overflow ?? TextOverflow.ellipsis,
  );
}

TextSpan calculateYearsOfWork() {
  DateTime now = DateTime.now();
  DateTime startedWorkInMilli = DateTime.parse('2017-01-01');
  Duration difference =
      (now.timeZoneOffset - startedWorkInMilli.timeZoneOffset);

  String result = (difference.inDays / 365).toStringAsExponential(0);
  double monthsInYears = (difference.inDays / 365) % 1;
  if (monthsInYears > 7.5) {
    result = ((difference.inDays / 365) + 1).toStringAsExponential(0);
  } else if (monthsInYears > 0.1) {
    result += '+';
  }
  result += ' years';
  return TextSpan(text: result);
}

Map<String, TextSpan> shortCodeMap(TextStyle defaultStyle) {
  return {
    '[entelect]': TextSpan(
      text: 'Entelect',
      style: TextStyle(color: HexColor('#004C8E')),
    ),
    '[redRubyIt]': TextSpan(
      text: 'Red Ruby IT',
      style: TextStyle(color: HexColor('#BE1F25')),
    ),
    '[flutter]': TextSpan(
      text: 'Flutter',
      style: defaultStyle,
    ),
    '[workDuration]': calculateYearsOfWork(),
    '[blog]': TextSpan(
      text: 'blog',
      style: defaultStyle,
    ),
    '[blogCvArticle]': TextSpan(
      text: 'click here to read it',
      style: defaultStyle,
    ),
  };
}

TextSpan shortCodesHandler(
  BuildContext context,
  String text,
  Map<String, TextSpan> shortCodeMapObj,
) {
  for (String scKey in shortCodeMapObj.keys) {
    TextSpan value = shortCodeMapObj[scKey]!;
    if (text.contains(scKey)) {
      return value;
    }
  }
  return TextSpan(
    text: text,
    style: TextStyle(
      color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? Colors.white60
          : Colors.black54,
    ),
  );
}
