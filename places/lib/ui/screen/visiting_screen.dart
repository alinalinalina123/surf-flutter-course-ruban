import 'package:flutter/material.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/ui/cards/sight_card.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/empty_list_widget.dart';

//Screen that displays places that user wants to visit/visited.
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    var listVisited = mocks
        .where((sight) => (sight).state == SightStateType.visited)
        .toList();

    var listWantToVisit = mocks
        .where((sight) => (sight).state == SightStateType.want_to_visit)
        .toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: favouritePageTitle,
          type: AppBarType.simple,
          tabBar: TabBar(
            indicatorPadding: topWidgetPadding,
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
                    type: SightStateType.want_to_visit,
                  );
                },
              )
            else
              EmptyListWidget(
                type: SightStateType.want_to_visit,
              ),
            if (listVisited.length > 0)
              ListView.builder(
                itemCount: listVisited.length,
                itemBuilder: (context, index) {
                  return SightCard(
                    sight: listVisited[index],
                    type: SightStateType.visited,
                  );
                },
              )
            else
              EmptyListWidget(
                type: SightStateType.visited,
              ),
          ],
        ),
      ),
    );
  }
}
