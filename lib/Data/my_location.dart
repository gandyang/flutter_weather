import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  double latitude2 = 0;
  double longitude2 = 0;

  Future<void> getMyCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude2 = position.latitude;
      longitude2 = position.longitude;

      print('위도: $latitude2');
      print('경도: $longitude2');
    } catch (e) {
      print('There was a problem with the internet connection');
    }
  }
}
