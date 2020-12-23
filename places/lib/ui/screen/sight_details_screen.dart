import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/widgets/button_with_icon_widget.dart';
import 'package:places/ui/widgets/image_full_widget.dart';
import 'package:places/ui/widgets/navigation_button_widget.dart';
import 'package:places/ui/widgets/separator_widget.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';
import 'package:places/ui/widgets/title_widget.dart';

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

    return Container(
      child: Column(
        children: [
          ImageFullWidget(url: widget.sight.url),
          TitleWidget(name: widget.sight.name),
          Row(
            children: [
              SubTitleWidget(
                name: widget.sight.type.name,
                style: greySubTitleBoldStyle,
                paddings: leftWidgetPadding,
              ),
              SubTitleWidget(
                name: "закрыто до 09:00",
                paddings: leftWidgetPadding,
              ),
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          SubTitleWidget(name: widget.sight.details),
          NavigationButtonWidget(title: buildDirectionButtonTitle),
          SeparatorWidget(),
          Row(
            children: [
              ButtonWithIconWidget(title: scheduleButtonTitle, icon: Icons.calendar_today,),
              ButtonWithIconWidget(title: favouriteButtonTitle, icon: Icons.favorite_border,),
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
