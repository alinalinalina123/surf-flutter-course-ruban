import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/ui/cards/sight_card.dart';
import 'package:places/ui/cards/sight_card_type.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/empty_list_widget.dart';
import 'package:places/utils/colors.dart';

//Screen that displays places that user wants to visit/visited.
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    var listVisited = mocks
        .where((sight) => (sight as Sight).state == SightStateType.visited)
        .toList();
    var listWantToVisit = mocks
        .where(
            (sight) => (sight as Sight).state == SightStateType.want_to_visit)
        .toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              favouritePageTitle,
              style: titlePageStyle,
              textAlign: TextAlign.center,
            ),
          ),
          bottom: TabBar(
            indicatorPadding: topWidgetPadding,
            indicator: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                color: darkBlue),
            unselectedLabelColor: greyLight,
            labelColor: white,
            tabs: [
              Tab(
                text: wantToVisitTabBarItemTitle,
              ),
              Tab(
                text: visitedTabBarItemTitle,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            if (listWantToVisit.length > 0)
              ListView.builder(
                itemCount: listWantToVisit.length,
                itemBuilder: (context, index) {
                  return SightCard(
                    sight: listWantToVisit[index],
                    type: SightCardType.want_to_visit,
                  );
                },
              )
            else
              EmptyListWidget(
                type: SightCardType.want_to_visit,
              ),
            if (listVisited.length > 0)
              ListView.builder(
                itemCount: listVisited.length,
                itemBuilder: (context, index) {
                  return SightCard(
                    sight: listVisited[index],
                    type: SightCardType.visited,
                  );
                },
              )
            else
              EmptyListWidget(
                type: SightCardType.visited,
              ),
          ],
        ),
      ),
    );
  }
}
