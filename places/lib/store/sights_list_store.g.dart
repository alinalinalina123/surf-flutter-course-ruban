// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sights_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SightsListStore on _SightsListBaseStore, Store {
  final _$allPlacesAtom = Atom(name: '_SightsListBaseStore.allPlaces');

  @override
  ObservableFuture<List<Sight>> get allPlaces {
    _$allPlacesAtom.reportRead();
    return super.allPlaces;
  }

  @override
  set allPlaces(ObservableFuture<List<Sight>> value) {
    _$allPlacesAtom.reportWrite(value, super.allPlaces, () {
      super.allPlaces = value;
    });
  }

  final _$_SightsListBaseStoreActionController =
      ActionController(name: '_SightsListBaseStore');

  @override
  void getAllPlaces() {
    final _$actionInfo = _$_SightsListBaseStoreActionController.startAction(
        name: '_SightsListBaseStore.getAllPlaces');
    try {
      return super.getAllPlaces();
    } finally {
      _$_SightsListBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allPlaces: ${allPlaces}
    ''';
  }
}
