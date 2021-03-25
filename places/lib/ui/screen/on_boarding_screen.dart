import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/field_types/indicators_type.dart';
import 'package:places/domain/onboarding_item.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/tabs_screen.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';
import 'package:places/ui/widgets/custom_page_view_indicator.dart';

/// Widget for OnBoarding page
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  var isButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        actions: [
          FlatButton(
            child: Text(skipButtonTitle),
            textColor: colorGreen,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return TabsScreen();
                }),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  isButtonVisible = index == OnBoardingItem.items.length - 1;
                });
              },
              children: _buildBoardingCard(context),
            ),
          ),
          Container(
            child: CustomPageViewIndicator(
              controller: _controller,
              itemCount: OnBoardingItem.items.length,
              type: IndicatorType.dots,
            ),
          ),
          isButtonVisible
              ? Padding(
                padding: standardWidgetPadding,
                child: CustomButtonWidget(
                    title: startButtonTitle,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return TabsScreen();
                        }),
                      );
                    },
                  ),
              )
              : Container(
                  height: 100,
                )
        ],
      ),
    );
  }

  List<Widget> _buildBoardingCard(BuildContext context) {
    List<Widget> listOfItems = [];
    for (var item in OnBoardingItem.items) {
      var widget = Column(
        children: [
          Padding(
            padding: onBoardingTopWidgetPadding,
            child: SvgPicture.asset(item.assetName),
          ),
          Padding(
            padding: onBoardingWidgetPadding,
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Padding(
            padding: onBoardingWidgetPadding,
            child: Text(
              item.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      );
      listOfItems.add(widget);
    }
    return listOfItems;
  }
}
