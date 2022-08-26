import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:flutter/material.dart';

Widget getTextSpanFromTemplateAndArray(
  BuildContext context,
  String origContent, {
  int? maxLines,
  TextOverflow? overflow,
}) {
  TextStyle defaultStyle = Theme.of(context)
      .textTheme
      .bodyText1!
      .copyWith(color: getTheme().getSecondaryColour(context));
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

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

TextSpan calculateYearsOfWork() {
  DateTime now = DateTime.now();
  DateTime startedWorkDateTime = DateTime.parse('2017-01-01');
  final differenceInDays = daysBetween(startedWorkDateTime, now);

  double numYears = (differenceInDays / 365);
  double monthsInYears = numYears % 1;
  String result = numYears.floor().toStringAsFixed(0);
  if (monthsInYears > 7.5) {
    result = (numYears + 1).round().toStringAsFixed(0);
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
          ? Colors.white70
          : Colors.black54,
    ),
  );
}
