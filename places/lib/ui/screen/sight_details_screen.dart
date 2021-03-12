import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/widgets/button_with_icon_widget.dart';
import 'package:places/ui/widgets/image_full_widget.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';
import 'package:places/ui/widgets/separator_widget.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';
import 'package:places/ui/widgets/title_widget.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/res/assets_name.dart';

/// Widget to show the details of the sight
class SightDetails extends StatefulWidget {
  final Sight sight;

  SightDetails({this.sight}) : super();

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ImageFullWidget(urls: widget.sight.urls),
            TitleWidget(name: widget.sight.name),
            Row(
              children: [
                SubTitleWidget(
                  name: widget.sight.type.name,
                  style: Theme.of(context).textTheme.headline2,
                  paddings: leftWidgetPadding,
                ),
                SubTitleWidget(
                  name: "закрыто до 09:00",
                  style: greySubTitleLightStyle,
                  paddings: leftWidgetPadding,
                ),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            SubTitleWidget(name: widget.sight.details),
            CustomButtonWidget(
              title: buildDirectionButtonTitle,
              iconName: directionIconLight,
              onPressed: () {
                print("Button pressed");
              },
            ),
            SeparatorWidget(),
            Row(
              children: [
                ButtonWithIconWidget(
                    title: scheduleButtonTitle,
                    iconName: calendarIconDark,
                    onPressed: () {
                      print("Button clicked");
                    }),
                ButtonWithIconWidget(
                  title: favouriteButtonTitle,
                  iconName: heartIconDarkUnselected,
                  onPressed: () {
                    print("Button clicked");
                  },
                ),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
