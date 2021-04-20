import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/widgets/button_with_icon_widget.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';
import 'package:places/ui/widgets/separator_widget.dart';
import 'package:places/ui/widgets/sliver_full_image_delegate.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';
import 'package:places/ui/widgets/title_widget.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/res/assets_name.dart';
import '../../mocks.dart';

/// Widget to show the details of the sight
class SightDetailsBottomSheet extends StatefulWidget {
  final int sightId;

  SightDetailsBottomSheet({
    Key key,
    @required this.sightId,
  }) : super();

  @override
  _SightDetailsBottomSheetState createState() =>
      _SightDetailsBottomSheetState();
}

class _SightDetailsBottomSheetState extends State<SightDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var sight = mocks.firstWhere((sight) => sight.id == widget.sightId);
    return Container(
      height: (MediaQuery.of(context).size.height / 4) * 3,
      color: bottomSheetColor,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26.0),
          topRight: Radius.circular(26.0),
        ),

          child: Container(
            color: Theme.of(context).primaryColor,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      delegate: SliverFullImageDelegate(sight.urls),
                    ),
                    SliverFillRemaining(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TitleWidget(
                              name: sight.name,
                            ),
                            Row(
                              children: [
                                SubTitleWidget(
                                  name: sight.type.name,
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
                            SubTitleWidget(name: sight.details),
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
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.black.withOpacity(0.2),
                  width: double.infinity,
                  child: Icon(
                    Icons.remove,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
