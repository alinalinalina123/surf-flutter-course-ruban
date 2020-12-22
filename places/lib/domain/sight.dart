
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

class Sight {
  String name;
  double lat;
  double lon;
  String url;
  String details;
  SightType type;

  Sight(String name, String url, double lat, double lon, String details, SightType type) {
    this.name = name;
    this.url = url;
    this.lat = lat;
    this.lon = lon;
    this.details = details;
    this.type = type;
  }
}