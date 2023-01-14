import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Location();

  double latitude;
  double longitude;

  void getCurrentLocation() async {
    try {
        LocationPermission permission;
        // LocationPermission permission = await Geolocator.requestPermission();
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
        );
        print('position $position');
        latitude = position.latitude;
        longitude = position.longitude;

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            // Permissions are denied, next time you could try
            // requesting permissions again (this is also where
            // Android's shouldShowRequestPermissionRationale 
            // returned true. According to Android guidelines
            // your App should show an explanatory UI now.
            return Future.error('Location permissions are denied');
          }
        }
        
        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately. 
          return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
        } 
    } catch (e) {
      print(e);
    }
  }
}