import 'package:places/ui/res/strings/strings.dart';

//Sight type
enum SightType {
  museum,
  tower,
  bridge,
  other
}

extension SightTypeName on SightType {
  String get name {
    switch (this) {
      case SightType.museum:
        return museumName;
      case SightType.tower:
        return towerName;
      case SightType.bridge:
        return bridgeName;
      default:
        return unknownName;
    }
  }
}