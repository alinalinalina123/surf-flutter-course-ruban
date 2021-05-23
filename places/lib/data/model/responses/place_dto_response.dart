import 'dart:convert';
import 'package:places/data/model/requests/base_request.dart';

class PlaceDTO implements BaseRequest {
  late int id;
  late double lat;
  late double lon;
  late double? distance;
  late String name;
  late String placeType;
  late String description;
  late List<dynamic> urls;

  PlaceDTO(
    this.id,
    this.lat,
    this.lon,
    this.description,
    this.name,
    this.placeType,
    this.urls,
    this.distance,
  );

  factory PlaceDTO.fromJson(Map<dynamic, dynamic> json) {
    return PlaceDTO(
      json['id'],
      json['lat'],
      json['lon'],
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
      'lon': this.lon,
      'description': this.description,
      'name': this.name,
      'placeType':this.placeType,
      'urls': this.urls,
    });
  }
}
