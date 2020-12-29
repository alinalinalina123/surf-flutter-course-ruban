import 'package:flutter/material.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/cards/sight_card_type.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';

//Widget that displayed when list is empty based on card type
class EmptyListWidget extends StatelessWidget {
  final SightCardType type;

  const EmptyListWidget({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              color: Colors.grey,
            ),
            SubTitleWidget(
              name: emptyText,
              style: greyTitleLightStyle,
              paddings: titleWidgetPadding,
            ),
            if (type == SightCardType.want_to_visit)
              SubTitleWidget(
                name: emptyWantToVisitText,
                style: greySubTitleLightStyle,
                paddings: bottomWidgetPadding,
              ),
            if (type == SightCardType.visited)
              SubTitleWidget(
                name: emptyVisitedText,
                style: greySubTitleLightStyle,
                paddings: bottomWidgetPadding,
              ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
