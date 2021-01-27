import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

//Widget to display small text. TextStyle and paddings can be customized
class SubTitleWidget extends StatelessWidget {
  final String name;
  final TextStyle style;
  final EdgeInsets paddings;

  const SubTitleWidget({Key key, @required this.name, this.style, this.paddings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: paddings ?? titleWidgetPadding,
        child: Text(
          name,
          style: style ?? Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
