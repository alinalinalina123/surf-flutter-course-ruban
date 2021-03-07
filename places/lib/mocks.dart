import 'package:places/domain/category.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/ui/res/assets_name.dart';
import 'domain/sight_type.dart';

final List<Sight> mocks = [
  Sight(
      name: "Лувр",
      url: "https://posmotrim.by/pics/37dcb2689.jpg",
      lat: 48.860294,
      lon: 2.338629,
      details: "Закрыто до 14:00",
      type: SightType.museum),
  Sight(
      name: "Мост золотые ворота Мост золотые ворота Мост золотые ворота",
      url: "https://www.history.com/.image/t_share/MTY1MTc3MjE0MzExMDgxNTQ1/topic-golden-gate-bridge-gettyimages-177770941.jpg",
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 9:00",
      type: SightType.place,
      state: SightStateType.visited),
  Sight(
      name: "Мостар (Старый мост)",
      url: "https://34travel.me/media/posts/5cc09d7c87bd6-mostar-og.jpg",
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 8:00",
      type: SightType.place,
      state: SightStateType.want_to_visit),
  Sight(
      name: "Эйфелева башня",
      url: "https://architime.ru/specarch/gustave_eiffel/1.jpg",
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 15:00",
      type: SightType.museum),
  Sight(
      name: "Бурдж-Хали́фа",
      url: "https://fs.tonkosti.ru/8k/1f/8k1fwkm9wg4kogs4k0s0g48kk.jpg",
      lat: 53.8884721,
      lon: 27.5443404,
      details: "Закрыто до 19:00",
      type: SightType.museum,
      state: SightStateType.want_to_visit)
];


final List<Category> categories = [
  Category(type: SightType.hotel, isSelected: false, iconName: hotelIcon),
  Category(type: SightType.restourant, isSelected: false, iconName: restourantIcon),
  Category(type: SightType.place, isSelected: false, iconName: placeIcon),
  Category(type: SightType.park, isSelected: false, iconName: parkIcon),
  Category(type: SightType.museum, isSelected: false, iconName: museumIcon),
  Category(type: SightType.cafe, isSelected: false, iconName: cafeIcon),
];

final List<String> photos = [
  "https://fs.tonkosti.ru/8k/1f/8k1fwkm9wg4kogs4k0s0g48kk.jpg",
  "https://architime.ru/specarch/gustave_eiffel/1.jpg"
];

final List<String> searchHistory = ["Музей", "кафе один"];