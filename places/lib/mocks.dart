import 'package:places/domain/category.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/ui/res/assets_name.dart';
import 'domain/sight_type.dart';

final List<Sight> mocks = [
  Sight(
    id: 0,
    name: "Лувр",
    urls: [
      "https://img-fotki.yandex.ru/get/5405/14403785.ba/0_a0e32_a011308a_XL.jpg"
    ],
    lat: 48.860294,
    lon: 2.338629,
    details: "Закрыто до 14:00",
    type: SightType.museum,
  ),
  Sight(
    id: 1,
    name: "Мост золотые ворота Мост золотые ворота Мост золотые ворота Мост золотые ворота Мост золотые ворота Мост золотые ворота",
    urls: [
      "https://www.history.com/.image/t_share/MTY1MTc3MjE0MzExMDgxNTQ1/topic-golden-gate-bridge-gettyimages-177770941.jpg"
    ],
    lat: 37.8185,
    lon: -122.4738,
    details: "Закрыто до 9:00",
    type: SightType.other,
    state: SightStateType.visited,
  ),
  Sight(
    id: 3,
    name: "Мостар (Старый мост)",
    urls: ["https://34travel.me/media/posts/5cc09d7c87bd6-mostar-og.jpg"],
    lat: 37.8185,
    lon: -122.4738,
    details: "Закрыто до 8:00",
    type: SightType.other,
    state: SightStateType.want_to_visit,
  ),
  Sight(
    id: 4,
    name: "Эйфелева башня",
    urls: ["https://architime.ru/specarch/gustave_eiffel/1.jpg"],
    lat: 37.8185,
    lon: -122.4738,
    details: "Закрыто до 15:00",
    type: SightType.museum,
  ),
  Sight(
    id: 5,
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
    state: SightStateType.want_to_visit,
  )
];


final List<Category> categories = [
  Category(SightType.hotel, false, hotelIcon),
  Category(SightType.restourant, false, restourantIcon),
  Category(SightType.other, false, placeIcon),
  Category(SightType.park, false, parkIcon),
  Category(SightType.museum, false, museumIcon),
  Category(SightType.cafe, false, cafeIcon),
];

final List<String> photos = [
  "https://fs.tonkosti.ru/8k/1f/8k1fwkm9wg4kogs4k0s0g48kk.jpg",
  "https://architime.ru/specarch/gustave_eiffel/1.jpg"
];

