import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'domain/sight_type.dart';

final List mocks = [
  Sight(
      name: "Лувр",
      url:
          "https://www.museumnext.com/wp-content/uploads/2019/01/louvre_popular.jpg",
      lat: 48.860294,
      lon: 2.338629,
      details: "Закрыто до 14:00",
      type: SightType.museum),
  Sight(
      name: "Мост золотые ворота Мост золотые ворота Мост золотые ворота",
      url:
          "https://www.history.com/.image/t_share/MTY1MTc3MjE0MzExMDgxNTQ1/topic-golden-gate-bridge-gettyimages-177770941.jpg",
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 9:00",
      type: SightType.bridge),
  Sight(
      name: "Мостар (Старый мост)",
      url: "https://34travel.me/media/posts/5cc09d7c87bd6-mostar-og.jpg",
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 8:00",
      type: SightType.bridge),
  Sight(
      name: "Эйфелева башня",
      url: "https://architime.ru/specarch/gustave_eiffel/1.jpg",
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 15:00",
      type: SightType.tower),
  Sight(
      name: "Бурдж-Хали́фа",
      url: "https://fs.tonkosti.ru/8k/1f/8k1fwkm9wg4kogs4k0s0g48kk.jpg",
      lat: 37.8185,
      lon: -122.4738,
      details: "Закрыто до 19:00",
      type: SightType.tower)
];
