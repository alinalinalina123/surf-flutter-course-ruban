import 'package:places/ui/res/strings.dart';

//Sight type
enum SightType { hotel, restourant, place, park, museum, cafe }

extension SightTypeName on SightType {
  String get name {
    switch (this) {
      case SightType.museum:
        return museumName;
      case SightType.hotel:
        return hotelName;
      case SightType.restourant:
        return restourantName;
      case SightType.place:
        return placeName;
      case SightType.park:
        return parkName;
      case SightType.cafe:
        return cafeName;
      default:
        return "";
    }
  }
}
