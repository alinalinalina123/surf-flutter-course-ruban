import 'package:mobx/mobx.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/domain/sight.dart';

part 'sights_list_store.g.dart';

/// This is the class used by code base
class SightsListStore = _SightsListBaseStore with _$SightsListStore;

/// The store-class
abstract class _SightsListBaseStore with Store {
  final PlaceInteractor _placeInteractor;

  _SightsListBaseStore(this._placeInteractor);

  @observable
  ObservableFuture<List<Sight>> allPlaces = ObservableFuture.value([]);

  @action
  void getAllPlaces() {
    var future = _placeInteractor.getPlaces();
    allPlaces = ObservableFuture(future);
  }
}
