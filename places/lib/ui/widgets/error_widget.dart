import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';

///Widget that displays error 
class ApiErrorWidget extends StatelessWidget {
  const ApiErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              child: SvgPicture.asset(errorIcon),
            ),
            SubTitleWidget(
              name: errorTitle,
              style: greyTitleLightStyle,
              padding: bottomWidgetPadding,
            ),
            SubTitleWidget(
              name: errorDescription,
              style: greySubTitleLightStyle,
              padding: bottomWidgetPadding,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
