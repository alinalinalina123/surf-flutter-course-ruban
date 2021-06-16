import 'dart:convert';

class PlaceDTO {
  late String id;
  late double lat;
  late double lon;
  late double distance;
  late String name;
  late String placeType;
  late String description;
  late List<String> urls;

  PlaceDTO(
    this.id,
    this.lat,
    this.lon,
    this.distance,
    this.description,
    this.name,
    this.placeType,
    this.urls,
  );

  factory PlaceDTO.fromJson(Map<String, dynamic> json) {
    return PlaceDTO(
      json['id'],
      json['lat'],
      json['lon'],
      json['distance'],
      json['description'],
      json['name'],
      json['placeType'],
      json['urls'],
    );
  }
}
