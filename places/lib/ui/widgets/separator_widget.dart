import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

//Widget to define custom app divider
class SeparatorWidget extends StatelessWidget {

  const SeparatorWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: titleWidgetPadding,
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}