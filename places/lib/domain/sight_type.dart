
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
        return 'Музей';
      case SightType.tower:
        return 'Башня';
      case SightType.bridge:
        return 'Мост';
      default:
        return "Неизвестный тип";
    }
  }
}