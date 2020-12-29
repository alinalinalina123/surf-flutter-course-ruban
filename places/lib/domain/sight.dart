import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/res/strings/strings.dart';

class Sight {
  String name;
  double lat;
  double lon;
  String url;
  String details;
  SightType type;
  SightStateType state;
  DateTime dateOfVisit;

  Sight({
        @required String name,
        @required String url,
        @required double lat,
        @required double lon,
        @required String details,
        @required SightType type,
        SightStateType state
      }) {
    this.name = name;
    this.url = url;
    this.lat = lat;
    this.lon = lon;
    this.details = details;
    this.type = type;
    this.dateOfVisit = DateTime.now();
    this.state = state ?? SightStateType.initial;
  }
}

extension SightStateName on Sight {
  String get stateDescription {
    var dateString = DateFormat('dd MM. yyyy').format(this.dateOfVisit);
    switch (this.state) {
      case SightStateType.initial:
        return '';
      case SightStateType.want_to_visit:
        return wantToVisitDescription.replaceAll("{0}", dateString);
      case SightStateType.visited:
        return visitedDescription.replaceAll("{0}", dateString);
      default:
        return "";
    }
  }
}
