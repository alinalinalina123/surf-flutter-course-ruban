import 'package:intl/intl.dart';
import 'package:places/data/model/responses/place_dto_response.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/res/strings.dart';

//Data class for sight
class Sight {
  late int id;
  late String name;
  late double lat;
  late double lon;
  late List<String> urls;
  late String details;
  late SightType type;
  late SightStateType? state;
  late DateTime? dateOfVisit;

  Sight({
    required int id,
    required String name,
    required List<String> urls,
    required double lat,
    required double lon,
    required String details,
    required SightType type,
    SightStateType? state,
  }) {
    this.id = id;
    this.name = name;
    this.urls = urls;
    this.lat = lat;
    this.lon = lon;
    this.details = details;
    this.type = type;
    this.dateOfVisit = DateTime.now();
    this.state = state ?? SightStateType.initial;
  }

  Sight.withDto(PlaceDTO place) {
    this.id = place.id;
    this.name = place.name;
    this.urls = place.urls.map((e) => e.toString()).toList();
    this.lat = place.lat;
    this.lon = place.lng;
    this.state = SightStateType.initial;
    this.details = place.description;
    this.dateOfVisit = DateTime.now();
    this.type = SightType.values
        .firstWhere((type) => type.toString().split('.').last == place.placeType, orElse: () => SightType.other);
  }
}

extension SightStateName on Sight {
  String get stateDescription {
    var dateString = DateFormat(simpleDateFormat).format(this.dateOfVisit ?? DateTime.now());
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
