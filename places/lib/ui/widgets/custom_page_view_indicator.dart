import 'package:flutter/material.dart';
import 'package:places/domain/field_types/indicators_type.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

/// An indicator showing the currently selected page of a PageController
class CustomPageViewIndicator extends AnimatedWidget {
  final PageController controller;
  final int itemCount;
  final IndicatorType type;

  CustomPageViewIndicator({
    required this.controller,
    required this.itemCount,
    this.type = IndicatorType.lines,
  }) : super(listenable: controller);

  Widget build(BuildContext context) {
    final dots = <Widget>[];
    for (var i = 0; i < itemCount; i++) {
      switch (type) {
        case IndicatorType.lines:
          dots.add(_buildLines(i, context));
          break;
        case IndicatorType.dots:
          dots.add(_buildDots(i, context));
          break;
      }
    }
    switch (type) {
      case IndicatorType.lines:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: dots,
        );
      case IndicatorType.dots:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dots,
        );
    }
  }

  Widget _buildLines(int index, BuildContext context) {
    var currentPage = (controller.page ?? controller.initialPage).round();
    return Container(
      decoration: BoxDecoration(
        borderRadius: standardWidgetCircleBorder,
      ),
      width: MediaQuery.of(context).size.width / itemCount,
      height: 8,
      child: Material(
        color: index == currentPage
            ? Theme.of(context).accentColor
            : Theme.of(context).accentColor.withOpacity(0.3),
      ),
    );
  }

  Widget _buildDots(int index, BuildContext context) {
    var currentPage = (controller.page ?? controller.initialPage).round();
    return Container(
      width: 25,
      height: 8,
      child: Material(
        type: index == currentPage ? MaterialType.card : MaterialType.circle,
        color: index == currentPage ? colorGreen : colorGrey.withOpacity(0.5),
      ),
    );
  }
}
