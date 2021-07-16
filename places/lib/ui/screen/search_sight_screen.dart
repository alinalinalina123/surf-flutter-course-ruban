import 'dart:io';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/requests/filter_criteria.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:provider/provider.dart';
import 'package:places/ui/cards/search_sight_card.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/empty_list_widget.dart';
import 'package:places/utils/geolocator.dart';

class SearchSightScreen extends StatefulWidget {
  static const routeName = '/mainScreen/sightListScreen/searchScreen';

  @override
  _SearchSightScreenState createState() => _SearchSightScreenState();
}

class _SearchSightScreenState extends State<SearchSightScreen> {
  String queryString = "";
  int? radius;
  List<Category>? categories;
  List<Sight> filteredSights = [];

  void _getFilteredSights() async {
    var userPosition = await determinePosition();
    var criteria = FilterCriteria(
        nameFilter: queryString,
        typeFilter: categories?.map<String>((category) => category.type.toString().split('.').last).toList(),
        lat: userPosition.latitude,
        lon: userPosition.longitude,
        radius: radius);
    var allPlaces = await context.read<SearchInteractor>().searchPlaces(criteria);
    setState(() {
      filteredSights = allPlaces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarTitle,
        type: AppBarType.search,
        onFilterApplied: (input) {
          setState(() {
            this.radius = input.radius;
            this.categories = input.categories;
            _getFilteredSights();
          });
        },
        onQueryChanged: (String query) {
          if (query.isNotEmpty && !context.read<SearchInteractor>().getOldHistory().contains(query))
            context.read<SearchInteractor>().saveQueryToHistory(query);
          setState(() {
            queryString = query;
            _getFilteredSights();
          });
        },
      ),
      body: !queryString.isNotEmpty ? _buildHistory() : _buildListOfSights(),
    );
  }

  Widget _buildListOfSights() {
    if (filteredSights.length > 0) {
      return ListView.builder(
        itemCount: filteredSights.length,
        physics: Platform.isAndroid
            ? ClampingScrollPhysics()
            : BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SearchSightCard(
            sight: filteredSights[index],
          );
        },
      );
    } else {
      return EmptyListWidget(
        type: SightStateType.initial,
      );
    }
  }

  Widget _buildHistory() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: _createHistoryList(),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }

  List<Widget> _createHistoryList() {
    List<Widget> widgets = [];
    for (String oldQuery in context.read<SearchInteractor>().getOldHistory()) {
      widgets.add(_buildHistoryCell(oldQuery));
    }
    if (widgets.length > 0) widgets.add(_clearHistoryButton());
    return widgets;
  }

  Widget _clearHistoryButton() {
    return FlatButton(
      child: Text(clearHistoryButtonTitle),
      textColor: colorGreen,
      onPressed: () {
        setState(() {
          context.read<SearchInteractor>().deleteAllHistory();
        });
      },
    );
  }

  Widget _buildHistoryCell(String oldQuery) {
    return ListTile(
      title: Text(
        oldQuery,
        style: greySimpleTitle,
      ),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            context.read<SearchInteractor>().deleteQueryFromHistory(oldQuery);
          });
        },
        icon: Icon(
          Icons.close,
          color: colorGrey,
        ),
      ),
      onTap: () {
        setState(() {
          queryString = oldQuery;
        });
      },
    );
  }
}
