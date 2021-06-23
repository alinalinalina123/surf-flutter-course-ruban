
import 'dart:convert';

import 'package:places/data/model/responses/place_dto_response.dart';
import 'package:places/network/network_provider.dart';

/// Repository for place data
class PlaceRepository {

  PlaceRepository() {
    this._provider = NetworkProvider();
  }

  NetworkProvider? _provider;

  ///__________GET___________

  // Get all places
  Future<List<PlaceDTO>?> allPlaces() async {
    try {
      var response = await _provider?.get('/place');
      var responseJson = json.decode(response ?? "");
      return responseJson.map<PlaceDTO>((m) => new PlaceDTO.fromJson(m)).toList();
    } catch (e) {
      print(e.toString());
    }
  }

  // Get place by ID
  Future<PlaceDTO?> getPlace(int id) async {
    try {
      var response = await _provider?.get('/place/$id');
      return PlaceDTO.fromJson(json.decode(response ?? ""));
    } catch (e) {
      print(e);
    }
  }

  /// __________DELETE_____________
  // Delete place by ID
  Future<List<PlaceDTO>?> deletePlace(int id) async {
    try {
      var response = await _provider?.delete('/place', query: {"id": id});
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
      var response = await _provider?.put('/place', place.convertToRequest(), query: {"id": id});
      return PlaceDTO.fromJson(json.decode(response ?? ""));
    } catch (e) {
      print(e);
    }
  }


  //Create place request
  Future<void> placeCreation(PlaceDTO place) async {
    try {
      await _provider?.post('/place', place.convertToRequest());
      return;
    } catch (e) {
      print(e);
    }
  }
}