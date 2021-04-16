import 'package:flutter/material.dart';
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
class SightDetails extends StatefulWidget {
  static const routeName = '/mainScreen/sightListScreen/sightDetailsScreen';
  SightDetails() : super();

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  Widget build(BuildContext context) {
    final int sightId = ModalRoute.of(context).settings.arguments as int;
    var sight = mocks.firstWhere((sight) => sight.id == sightId);
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverFullImageDelegate(sight.urls),
            ),
            SliverSafeArea(
              sliver: SliverFillRemaining(
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
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
