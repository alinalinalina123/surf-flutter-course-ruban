
import 'dart:convert';

import 'package:places/data/model/requests/filter_criteria.dart';
import 'package:places/data/model/responses/place_dto_response.dart';
import 'package:places/network/network_provider.dart';

/// Repository for place data
class PlaceRepository {

  static final provider = NetworkProvider();

  ///__________GET___________

  // Get all places
  Future<List<PlaceDTO>?> allPlaces() async {
    try {
      var response = await provider.getHTTP('/place');
      var responseJson = json.decode(response ?? "");
      return responseJson.map<PlaceDTO>((m) => new PlaceDTO.fromJson(m)).toList();
    } catch (e) {
      print(e.toString());
    }
  }

  // Get place by ID
  Future<PlaceDTO?> getPlace(int id) async {
    try {
      var response = await provider.getHTTP('/place/$id');
      return PlaceDTO.fromJson(json.decode(response ?? ""));
    } catch (e) {
      print(e);
    }
  }

  /// __________DELETE_____________
  // Delete place by ID
  Future<List<PlaceDTO>?> deletePlace(int id) async {
    try {
      var response = await provider.deleteHTTP('/place', query: {"id": id});
      List responseJson = json.decode(response ?? "");
      return responseJson.map<PlaceDTO>((m) => new PlaceDTO.fromJson(m)).toList();
    } catch (e) {
      print(e);
    }
  }

  /// __________PUT_____________
  // Update place by ID
  Future<PlaceDTO?> updatePlace(int id, PlaceDTO place) async {
    try {
      var response = await provider.putHTTP('/place', place.convertToRequest(), query: {"id": id});
      return PlaceDTO.fromJson(json.decode(response ?? ""));
    } catch (e) {
      print(e);
    }
  }

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

  //Create place request
  Future<void> placeCreation(PlaceDTO place) async {
    try {
      await provider.postHTTP('/place', place.convertToRequest());
      return;
    } catch (e) {
      print(e);
    }
  }
}