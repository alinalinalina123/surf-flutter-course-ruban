import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

// Widget to display button with customized title and background color
class PositionedButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final double left;
  final double right;
  final double bottom;
  final double top;

  const PositionedButtonWidget(
      {Key key,
      this.title,
      this.icon,
      this.color,
      this.left,
      this.top,
      this.bottom,
      this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child:  Container(height: 20, width: 20, color: color ?? Colors.white),
    );
  }
}
