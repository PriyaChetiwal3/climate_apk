

import 'package:climate_apk/services/networking.dart';
import 'package:climate_apk/services/weather.dart';
import 'package:climate_apk/uiscreens/location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// const apikey = ""
class LoadingScreen extends StatefulWidget {

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await  WeatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }


// Future<Position?> determinePosition() async {
//   LocationPermission permission;
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location Not Available');
//     }
//   } else {
//     throw Exception('Error');
//   }
//   return await Geolocator.getCurrentPosition();
// }

  @override
  Widget build(BuildContext context) {
    print("hii");
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.teal,
          height: 200.0,
        ),
      ),
    );
  }
}
// static getLocation() async {
//   LocationPermission permission = await Geolocator.checkPermission();
//
//   if (permission == LocationPermission.denied) {
//     await Geolocator.requestPermission();
//
//     return;
//   } else if (permission == LocationPermission.deniedForever) {
//     await Geolocator.openLocationSettings();
//
//     return;
//   } else {
//     final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print("latitude = ${position.latitude}");
//     print("longitude= ${position.longitude}");
//   }
