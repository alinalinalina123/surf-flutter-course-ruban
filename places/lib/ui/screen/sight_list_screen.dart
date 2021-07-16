
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobx/mobx.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/store/sights_list_store.dart';
import 'package:places/ui/cards/sight_card.dart';
import 'package:places/ui/res/strings.dart';

import 'package:places/ui/screen/search_sight_screen.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_fab.dart';
import 'package:places/ui/widgets/error_widget.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'add_sight_screen.dart';

//Widget that displays list of sights
class SightListScreen extends StatefulWidget {
  static const routeName = '/mainScreen/sightListScreen';

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {

  late SightsListStore store;

  @override
  void initState() {
    store = SightsListStore(context.read<PlaceInteractor>());
    store.getAllPlaces();
    super.initState();
  }

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
            Observer(builder: (_) {
              return store.allPlaces.status == FutureStatus.pending ?
              SliverFillRemaining(
                child: Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ) : _buildCollection(store.allPlaces.value ?? List.empty());
            })
          ],
        ),
      ),
    );
  }

  Widget _buildCollection(List<Sight> sights) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var list = SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return SightCard(
            sight: sights[index],
            index: index,
            stateUpdated: () {
              store.getAllPlaces();
            },
          );
        },
        childCount: sights.length,
      ),
    );

    var grid = SliverStaggeredGrid(
      gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return SightCard(
            sight: sights[index],
            index: index,
            stateUpdated: () {
              store.getAllPlaces();
            },
          );
        },
        childCount: sights.length,
      ),
    );

    return isPortrait ? list : grid;
  }
}
