import 'dart:convert';
import 'package:places/data/model/requests/base_request.dart';
import 'package:places/domain/sight.dart';

class PlaceDTO implements BaseRequest {
  late int id;
  late double lat;
  late double lng;
  late double? distance;
  late String name;
  late String placeType;
  late String description;
  late List<dynamic> urls;

  PlaceDTO(
    this.id,
    this.lat,
    this.lng,
    this.description,
    this.name,
    this.placeType,
    this.urls,
    this.distance,
  );

  PlaceDTO.fromSight(Sight sight) {
   this.name = sight.name;
   this.description = sight.details;
   this.lat = sight.lat;
   this.lng = sight.lon;
   this.urls = List.empty();
   this.placeType = sight.type.toString().split('.').last;
  }

  factory PlaceDTO.fromJson(Map<dynamic, dynamic> json) {
    return PlaceDTO(
      json['id'],
      json['lat'],
      json['lng'],
      json['description'],
      json['name'],
      json['placeType'],
      json['urls'],
      json['distance'] ?? null,
    );
  }

  @override
  String convertToRequest() {
    return jsonEncode(<String, dynamic>{
      'lat': this.lat,
      'lng': this.lng,
      'description': this.description,
      'name': this.name,
      'placeType':this.placeType,
      'urls': this.urls,
    });
  }
}
