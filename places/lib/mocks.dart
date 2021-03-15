import 'package:places/domain/category.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/ui/res/assets_name.dart';
import 'domain/sight_type.dart';

final List<Sight> mocks = [
  Sight(
      name: "Лувр",
      urls: [
        "https://img-fotki.yandex.ru/get/5405/14403785.ba/0_a0e32_a011308a_XL.jpg"
      ],
      lat: 48.860294,
      lon: 2.338629,
      details: "Закрыто до 14:00",
      type: SightType.museum),
  Sight(
      name: "Мост золотые ворота Мост золотые ворота Мост золотые ворота",
      urls: [
        "https://www.history.com/.image/t_share/MTY1MTc3MjE0MzExMDgxNTQ1/topic-golden-gate-bridge-gettyimages-177770941.jpg"
      ],
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 9:00",
      type: SightType.place,
      state: SightStateType.visited),
  Sight(
      name: "Мостар (Старый мост)",
      urls: ["https://34travel.me/media/posts/5cc09d7c87bd6-mostar-og.jpg"],
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 8:00",
      type: SightType.place,
      state: SightStateType.want_to_visit),
  Sight(
      name: "Эйфелева башня",
      urls: ["https://architime.ru/specarch/gustave_eiffel/1.jpg"],
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 15:00",
      type: SightType.museum),
  Sight(
      name: "Бурдж-Хали́фа",
      urls: [
        "https://fs.tonkosti.ru/8k/1f/8k1fwkm9wg4kogs4k0s0g48kk.jpg",
        "https://static.tonkosti.ru/tonkosti/table_img/g142/3838/57254999.jpg",
        "https://incomartour.com.ua/mediafiles/images/places/20180325103101/burdzhhalifa%20(27).jpg",
        "https://knowhow.pp.ua/wp-content/uploads/2020/01/Burj-Khalifa-New-Years-Eve-Dubai-2019-19-0120.jpg",
      ],
      lat: 53.8884721,
      lon: 27.5443404,
      details: "Закрыто до 19:00",
      type: SightType.museum,
      state: SightStateType.want_to_visit)
];

var listVisited =
    mocks.where((sight) => (sight).state == SightStateType.visited).toList();

var listWantToVisit = mocks
    .where((sight) => (sight).state == SightStateType.want_to_visit)
    .toList();

void updateStateOfData() {
  listVisited =
      mocks.where((sight) => (sight).state == SightStateType.visited).toList();

  listWantToVisit = mocks
      .where((sight) => (sight).state == SightStateType.want_to_visit)
      .toList();
}

final List<Category> categories = [
  Category(type: SightType.hotel, isSelected: false, iconName: hotelIcon),
  Category(
      type: SightType.restourant, isSelected: false, iconName: restourantIcon),
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
