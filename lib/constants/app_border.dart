import 'package:flutter/material.dart';

BorderRadius defaultImageBorderRadius = const BorderRadius.all(
  Radius.circular(8),
);
BorderRadius defaultCardBorderRadius = const BorderRadius.all(
  Radius.circular(16),
);

BorderRadius defaultCardBorderRadiusLeft = const BorderRadius.only(
  topLeft: Radius.circular(16),
  bottomLeft: Radius.circular(16),
);

RoundedRectangleBorder defaultCardBorderShape = RoundedRectangleBorder(
  borderRadius: defaultCardBorderRadius,
);
RoundedRectangleBorder defaultCardBorderShapeLeft = RoundedRectangleBorder(
  borderRadius: defaultCardBorderRadiusLeft,
);
