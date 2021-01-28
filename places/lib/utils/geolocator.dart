import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

/// Retrieves location of user
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are denied, we cannot request permissions.');
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return Future.error(
          'Location permissions are denied.');
    }
  }

  return await Geolocator.getLastKnownPosition();
}

/// Calculate distance between user and sight
Future<List<Sight>> distanceBetweenUserAndSight(List<Sight> sights, RangeValues range) async {
  if(range.start == null && range.end == null) {
    return mocks;
  }

  Position position = await _determinePosition();
  return sights.where((sight) =>
      Geolocator.distanceBetween(
              position.latitude, position.longitude, sight.lat, sight.lon) >=
          range.start &&
      Geolocator.distanceBetween(
              position.latitude, position.longitude, sight.lat, sight.lon) <=
          range.end).toList();
}
