import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:places/utils/colors.dart';

TextStyle appBarStyle = const TextStyle(
  color: greyStandard,
  fontStyle: FontStyle.normal,
  fontSize: 32,
);

TextStyle whiteTitleStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
  fontSize: 14,
);

TextStyle greyTitleStyle = const TextStyle(
  color: greyStandard,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
  fontSize: 16,
);

TextStyle greyTitleBigStyle = const TextStyle(
  color: greyStandard,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
  fontSize: 24,
);

TextStyle titlePageStyle = const TextStyle(
  color: greyStandard,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
  fontSize: 18,
);

TextStyle greySubTitleStyle = const TextStyle(
  color: greyStandard,
  fontStyle: FontStyle.normal,
  fontSize: 14,
);

TextStyle greyTitleLightStyle = const TextStyle(
  color: Colors.grey,
  fontStyle: FontStyle.normal,
  fontSize: 18,
);

TextStyle greySubTitleLightStyle = const TextStyle(
  color: Colors.grey,
  fontStyle: FontStyle.normal,
  fontSize: 14,
);

TextStyle greenSubTitleStyle = const TextStyle(
  color: Colors.green,
  fontStyle: FontStyle.normal,
  fontSize: 14,
);

TextStyle greySubTitleBoldStyle = const TextStyle(
  color: greyStandard,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

EdgeInsets appBarPadding = const EdgeInsets.only(
  left: 16,
  top: 64,
  right: 16,
);

EdgeInsets standardWidgetPadding = EdgeInsets.all(16);

EdgeInsets leftWidgetPadding = EdgeInsets.only(left: 16);

EdgeInsets bottomWidgetPadding = EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 2);

EdgeInsets topWidgetPadding = EdgeInsets.only(left: 16, right: 16);

EdgeInsets titleWidgetPadding = EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0);

EdgeInsets smallPadding = EdgeInsets.only(left: 16.0, right: 16.0, top: 8);

BorderRadius standardWidgetCircleBorder = BorderRadius.circular(16);

BorderRadius standardWidgetTopCircleBorder = BorderRadius.only(
  topLeft: Radius.circular(16),
  topRight: Radius.circular(16),
);
