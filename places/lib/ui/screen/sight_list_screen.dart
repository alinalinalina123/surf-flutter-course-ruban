import 'package:flutter/material.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/ui/cards/sight_card.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/search_sight_screen.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_fab.dart';
import 'package:places/ui/widgets/search_bar.dart';

import 'add_sight_screen.dart';

//Widget that displays list of sights
class SightListScreen extends StatefulWidget {
  static const routeName = '/mainScreen/sightListScreen';
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          title: newPlaceButtonTitle,
          icon: Icons.add,
          onPressed: () {
            Navigator.pushNamed(
              context,
              AddSightScreen.routeName,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              title: appBarTitle,
              type: AppBarType.main,
            ),
            SliverPadding(
              padding: new EdgeInsets.all(0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate([
                  CustomSearchBar(
                    isForNavigation: true,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        SearchSightScreen.routeName,
                      );
                    },
                  ),
                ]),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                 (context, index) {
                  return SightCard(
                    sight: mocks[index],
                    index: index,
                    stateUpdated: () {
                      setState(() {
                        updateStateOfData();
                      });
                    },
                  );
                },
                childCount: mocks.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

