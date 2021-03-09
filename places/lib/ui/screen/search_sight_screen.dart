import 'package:flutter/material.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/cards/search_sight_card.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_list_view.dart';
import 'package:places/ui/widgets/empty_list_widget.dart';

class SearchSightScreen extends StatefulWidget {
  @override
  _SearchSightScreenState createState() => _SearchSightScreenState();
}

class _SearchSightScreenState extends State<SearchSightScreen> {
  String queryString = "";
  List<Sight> filteredSights;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarTitle,
        type: AppBarType.search,
        onFilterApplied: (sights) {
          setState(() {
            filteredSights = sights;
          });
        },
        onQueryChanged: (String query) {
          if (query.isNotEmpty && !searchHistory.contains(query))
            searchHistory.add(query);
          setState(() {
            queryString = query;
          });
        },
      ),
      body: !queryString.isNotEmpty ? _buildHistory() : _buildListOfSights(),
    );
  }

  Widget _buildListOfSights() {
    var sightsToDisplay = _sightSearchResult(queryString);
    if (sightsToDisplay.length > 0) {
      return CustomListView(
        list: sightsToDisplay,
        itemBuilder: (context, index) {
          return SearchSightCard(
            sight: sightsToDisplay[index],
          );
        },
      );
    } else {
      return EmptyListWidget(
        type: SightStateType.initial,
      );
    }
  }

  List<Sight> _sightSearchResult(String query) {
    var listToDisplay = filteredSights != null ? filteredSights : mocks;
    return listToDisplay
        .where((sight) => sight.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
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
    for (String oldQuery in searchHistory) {
      widgets.add(_buildHistoryCell(oldQuery));
    }
    if(widgets.length > 0) widgets.add(_clearHistoryButton());
    return widgets;
  }

  Widget _clearHistoryButton() {
    return FlatButton(
      child: Text(clearHistoryButtonTitle),
      textColor: colorGreen,
      onPressed: () {
        setState(() {
          searchHistory.clear();
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
            searchHistory.remove(oldQuery);
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
