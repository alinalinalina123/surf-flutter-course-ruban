
import 'package:flutter/foundation.dart';
import 'package:places/data/model/requests/filter_criteria.dart';
import 'package:places/data/model/responses/place_dto_response.dart';
import 'package:places/data/repository/search_repository.dart';
import 'package:places/domain/sight.dart';

final searchInteractor = SearchInteractor(SearchRepository());

///Interactor for search places
class SearchInteractor {
  final SearchRepository _searchRepository;

  SearchInteractor(this._searchRepository);
  List<String> _history = List.empty(growable: true);


  Future<List<Sight>> searchPlaces(FilterCriteria criteria) async {
    List<PlaceDTO>? places = await _searchRepository.filteredPlaces(criteria);
    return places?.map<Sight>((place) => Sight.withDto(place)).toList() ?? List.empty();
  }

  void saveQueryToHistory(String query) {
    if (query.isNotEmpty && !_history.contains(query))
      _history.add(query);
  }

  void deleteQueryFromHistory(String query) {

  }

  void deleteAllHistory() {
    _history.clear();
  }
  
  List<String> getOldHistory() {
    return _history;
  }

}
