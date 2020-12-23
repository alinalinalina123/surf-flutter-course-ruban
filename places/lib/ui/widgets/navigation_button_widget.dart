import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

// Widget to display button with customized title and background color
class NavigationButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const NavigationButtonWidget({Key key, @required this.title, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: titleWidgetPadding,
      child: Container(
        color: Colors.green,
        height: 48,
      ),
    );
  }
}