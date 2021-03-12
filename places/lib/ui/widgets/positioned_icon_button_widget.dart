import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Widget to display button with customized title and background color
class PositionedIconButtonWidget extends StatelessWidget {
  final String iconName;
  final Color color;
  final double left;
  final double right;
  final double bottom;
  final double top;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const PositionedIconButtonWidget({
    Key key,
    @required this.iconName,
    @required this.onPressed,
    this.color,
    this.left,
    this.top,
    this.bottom,
    this.right,
    this.height,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: IconButton(
        icon: SvgPicture.asset(iconName, width: width ?? 18, height: height ?? 18),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
