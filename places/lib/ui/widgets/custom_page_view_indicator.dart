import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

/// An indicator showing the currently selected page of a PageController
class CustomPageViewIndicator extends AnimatedWidget {
  final PageController controller;
  final int itemCount;

  CustomPageViewIndicator({this.controller, this.itemCount})
      : super(listenable: controller);

  Widget build(BuildContext context) {
    final dots = <Widget>[];
    for (var i = 0; i < itemCount; i++) {
      dots.add(_buildDot(i, context));
    }
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dots,
    );
  }

  Widget _buildDot(int index, BuildContext context) {
    var currentPage = (controller.page ?? controller.initialPage).round();
    return new Container(
      decoration: BoxDecoration(
        borderRadius: standardWidgetCircleBorder,
      ),
      width: MediaQuery.of(context).size.width / itemCount,
      height: 8,
      child: new Material(
        color: index == currentPage
            ? Theme.of(context).accentColor
            : Theme.of(context).accentColor.withOpacity(0.3),
      ),
    );
  }
}
