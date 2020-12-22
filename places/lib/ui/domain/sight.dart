
enum SightType {
  building,
  monument,
  museum,
  statue,
  tower,
  bridge,
  palace,
  other
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