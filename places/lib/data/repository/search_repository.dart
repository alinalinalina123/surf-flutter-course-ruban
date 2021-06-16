
import 'dart:convert';

import 'package:places/data/model/requests/filter_criteria.dart';
import 'package:places/data/model/responses/place_dto_response.dart';
import 'package:places/network/network_provider.dart';

/// Repository for searching place data
class SearchRepository {

  static final provider = NetworkProvider();

  /// __________POST_____________
  //Filtered places request
  Future<List<PlaceDTO>?> filteredPlaces(FilterCriteria criteria) async {
    try {
      var response = await provider.postHTTP('/filtered_places', criteria.convertToRequest());
      List responseJson = json.decode(response ?? "");
      return responseJson.map<PlaceDTO>((m) => new PlaceDTO.fromJson(m)).toList();
    } catch (e) {
      print(e);
    }
  }

}