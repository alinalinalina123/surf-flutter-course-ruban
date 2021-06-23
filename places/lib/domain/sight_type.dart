import 'package:places/ui/res/strings.dart';

//Sight type
enum SightType { temple, monument, park, theatre, museum, hotel, restourant, cafe, other }

extension SightTypeName on SightType {
  String get name {
    switch (this) {
      case SightType.museum:
        return museumName;
      case SightType.hotel:
        return hotelName;
      case SightType.restourant:
        return restourantName;
      case SightType.temple:
        return templeName;
      case SightType.park:
        return parkName;
      case SightType.cafe:
        return cafeName;
      case SightType.monument:
        return monumentName;
      case SightType.theatre:
        return theatreName;
      case SightType.other:
        return otherName;
    }
  }
}
