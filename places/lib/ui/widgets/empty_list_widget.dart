import 'package:flutter/material.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';

//Widget that displayed when list is empty based on card type
class EmptyListWidget extends StatelessWidget {
  final SightStateType type;

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
              child: Icon(
                Icons.search,
              ),
            ),
            SubTitleWidget(
              name:
                  type == SightStateType.initial ? emptySearchText : emptyText,
              style: greyTitleLightStyle,
              paddings: titleWidgetPadding,
            ),
            if (type == SightStateType.want_to_visit)
              SubTitleWidget(
                name: emptyWantToVisitText,
                style: greySubTitleLightStyle,
                paddings: bottomWidgetPadding,
              ),
            if (type == SightStateType.visited)
              SubTitleWidget(
                name: emptyVisitedText,
                style: greySubTitleLightStyle,
                paddings: bottomWidgetPadding,
              ),
            if (type == SightStateType.initial)
              SubTitleWidget(
                name: emptySearchDescriptionText,
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
