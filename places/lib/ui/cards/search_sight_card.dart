import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/widgets/image_card_widget.dart';
import 'package:places/ui/widgets/separator_widget.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';

// Widget for card view of sight
class SearchSightCard extends StatelessWidget {
  final Sight sight;

  SearchSightCard({
    Key key,
    @required this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          child: InkWell(
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
            child: Row(
              children: [
                _buildCardImage(),
                const SizedBox(height: 16),
                _buildCardDescription(),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardImage() {
    return SizedBox(
        width: 56,
        height: 56,
        child: ImageCardWidget(
          url: sight.url,
          radius: 10.0,
        ));
  }

  Widget _buildCardDescription() {
    return Expanded(
      child: Column(
        children: [
          SubTitleWidget(
            name: sight.name,
            paddings: topWidgetPadding,
          ),
          SubTitleWidget(
            name: sight.type.name,
            style: greySimpleTitle,
            paddings: topWidgetPadding,
          ),
          SeparatorWidget(),
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
