import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

//Widget to display small text. TextStyle and paddings can be customized
class SubTitleWidget extends StatelessWidget {
  final String name;
  final TextStyle? style;
  final EdgeInsets? padding;

  const SubTitleWidget({
    Key? key,
    required this.name,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: padding ?? titleWidgetPadding,
        child: Text(
          name,
          style: style ?? Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
