import 'dart:convert';

class FilterCriteria {
  late String nameFilter;
  late double lat;
  late double lon;
  late List<String> typeFilter;

  FilterCriteria({
    required String nameFilter,
    required List<String> typeFilter,
    required double lat,
    required double lon,
  }) {
    this.nameFilter = nameFilter;
    this.typeFilter = typeFilter;
    this.lat = lat;
    this.lon = lon;
  }

  String requestBody() {
    return jsonEncode(<String, dynamic>{
      'nameFilter': this.nameFilter,
      'typeFilter': this.typeFilter,
      'lat': this.lat,
      'lon': this.lon,
    });
  }
}
