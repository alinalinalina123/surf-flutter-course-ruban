import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/image_card_widget.dart';
import 'package:places/ui/widgets/positioned_icon_button_widget.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';

// Widget for card view of sight
class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: standardWidgetPadding,
      child: Container(
        constraints: BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: standardWidgetCircleBorder,
        ),
        child: Column(
          children: [
            _buildCardImage(),
            const SizedBox(height: 16),
            _buildCardDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage() {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: SizedBox(
        width: double.infinity,
        height: 96,
        child: Stack(children: [
          ImageCardWidget(url: sight.url),
          SubTitleWidget(
            name: sight.type.name,
            style: whiteTitleStyle,
            paddings: standardWidgetPadding,
          ),
          PositionedButtonWidget(
            top: 16,
            right: 16,
          ),
        ]),
      ),
    );
  }

  Widget _buildCardDescription() {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        child: Column(
          children: [
            SubTitleWidget(
              name: sight.name,
              style: greyTitleStyle,
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
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
