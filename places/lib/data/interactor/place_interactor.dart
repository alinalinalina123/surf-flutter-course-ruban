import 'package:flutter/material.dart';
import 'package:places/data/model/responses/place_dto_response.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/utils/geolocator.dart';

final placeInteractor = PlaceInteractor(PlaceRepository());

///Interactor for places
class PlaceInteractor {
  final PlaceRepository _placeRepository;

  PlaceInteractor(this._placeRepository);
  List<Sight> _allSights = List.empty();

  Future<List<Sight>> getPlaces() async {
    List<PlaceDTO>? places = await _placeRepository.allPlaces();
    _allSights = places?.map<Sight>((place) => Sight.withDto(place)).toList() ?? List.empty();
    return _allSights;
  }

  Future<List<Sight>> getPlacesFiltered(RangeValues? range, List<Category> categories) async {
    List<PlaceDTO>? places = await _placeRepository.allPlaces();
    _allSights = places?.map<Sight>((place) => Sight.withDto(place)).toList() ?? List.empty();
    return distanceBetweenUserAndSight(_allSights, range);
  }

  Future<Sight> getPlaceDetails(int id) async {
    PlaceDTO? place = await _placeRepository.getPlace(id);
    Sight sights = Sight.withDto(place!);
    return sights;
  }

  List<Sight> getFavouritePlaces() {
    return _allSights.where((sight) => sight.state == SightStateType.want_to_visit).toList();
  }

  void addToFavourites(Sight place) {
    return _allSights.forEach((sight) {
      if(sight == place) {
        sight.state = SightStateType.want_to_visit;
      }
    });
  }

  void removeFromFavourites(Sight place) {
    return _allSights.forEach((sight) {
      if(sight == place) {
        sight.state = SightStateType.initial;
      }
    });
  }

  List<Sight> getVisitPlaces() {
    return _allSights.where((sight) => sight.state == SightStateType.visited).toList();
  }

  void addToVisit(Sight place) {
    return _allSights.forEach((sight) {
      if(sight == place) {
        sight.state = SightStateType.visited;
      }
    });
  }

  void addNewPlace(Sight place) {
    _placeRepository.placeCreation(PlaceDTO.fromSight(place));
  }

}
