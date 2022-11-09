import 'package:geolocator/geolocator.dart';

class Location {
 static late double latitude;
 static late double longitude;

 static Future<dynamic> getCurrentLocation() async {
    try {
     // Location location = await Geolocator.getCurrentLocation(desiredAccuracy: LocationAccuracy.low);
      Location location = (await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)) as Location;
      latitude = Location.latitude;
      longitude = Location.longitude;
    }
    catch (e){
      print(e);
    }
  }
}

// import 'package:geolocator/geolocator.dart';
//
// class Location {
//   late double latitude;
//   late double longitude;
//
//   Future<void> getCurrentLocation() async {
//     try {
//       Position position = await Geolocator
//           .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//
//       latitude = position.latitude;
//       longitude = position.longitude;
//     } catch (e) {
//       print(e);
//     }
//   }
// }