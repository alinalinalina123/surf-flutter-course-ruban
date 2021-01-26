import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

//Widget to display titles
class TitleWidget extends StatelessWidget {
  final String name;

  const TitleWidget({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: titleWidgetPadding,
      child: Text(
        name,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
