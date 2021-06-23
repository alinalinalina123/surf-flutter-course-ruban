import 'dart:convert';

import 'package:places/data/model/requests/base_request.dart';

///Criteria for filtering places
class FilterCriteria implements BaseRequest {
  late String? nameFilter;
  late double? lat;
  late double? lon;
  late List<String>? typeFilter;
  late int? radius;

  FilterCriteria({
    String? nameFilter,
    List<String>? typeFilter,
    double? lat,
    double? lon,
    int? radius,
  }) {
    this.nameFilter = nameFilter;
    this.typeFilter = typeFilter;
    if(radius != null && lat != null && lon != null) {
      this.lat = lat;
      this.lon = lon;
      this.radius = radius;
    } else {
      this.lat = null;
      this.lon = null;
      this.radius = null;
    }
  }

  @override
  String convertToRequest() {
    return jsonEncode(<String, dynamic>{
      'nameFilter': this.nameFilter,
      'typeFilter': this.typeFilter,
      'lat': this.lat,
      'lon': this.lon,
      'radius' : this.radius
    });
  }
}
