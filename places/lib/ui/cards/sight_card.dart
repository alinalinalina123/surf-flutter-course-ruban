import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/widgets/image_card_widget.dart';
import 'package:places/ui/widgets/positioned_icon_button_widget.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';

// Widget for card view of sight
class SightCard extends StatelessWidget {
  final Sight sight;
  final SightStateType type;

  SightCard({Key key, @required this.sight, this.type = SightStateType.initial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: standardWidgetPadding,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: standardWidgetCircleBorder,
          ),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: standardWidgetCircleBorder,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SightDetails(
                    sight: sight,
                  );
                }),
              );
            },
            child: Column(
              children: [
                _buildCardImage(),
                const SizedBox(height: 16),
                _buildCardDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardImage() {
    return SizedBox(
      width: double.infinity,
      height: 96,
      child: Stack(children: [
        ImageCardWidget(url: sight.url),
        SubTitleWidget(
          name: sight.type.name,
          style: whiteTitleStyle,
          paddings: standardWidgetPadding,
        ),
        PositionedIconButtonWidget(
          top: 16,
          right: 16,
          iconName: (type == SightStateType.initial)
              ? heartIconLightUnselected
              : closeIconLight,
          onPressed: () {
            print("Button clicked");
          },
        ),
        if (type != SightStateType.initial)
          PositionedIconButtonWidget(
            top: 16,
            right: 48,
            iconName: (type == SightStateType.want_to_visit)
                ? calendarIconLight
                : shareIconLight,
            onPressed: () {
              print("Button clicked");
            },
          )
      ]),
    );
  }

  Widget _buildCardDescription() {
    return Column(
      children: [
        SubTitleWidget(
          name: sight.name,
          paddings: topWidgetPadding,
        ),
        if (type == SightStateType.visited)
          SubTitleWidget(
            name: sight.stateDescription,
            style: greenSubTitleStyle,
            paddings: bottomWidgetPadding,
          ),
        if (type == SightStateType.want_to_visit)
          SubTitleWidget(
            name: sight.stateDescription,
            style: greySubTitleLightStyle,
            paddings: bottomWidgetPadding,
          ),
        SubTitleWidget(
          name: sight.details,
          style: greySubTitleLightStyle,
          paddings: bottomWidgetPadding,
        )
      ],
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
