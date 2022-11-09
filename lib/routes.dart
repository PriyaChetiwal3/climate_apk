

import 'package:climate_apk/uiscreens/city_screen.dart';
import 'package:climate_apk/uiscreens/loading_screen.dart';
import 'package:climate_apk/uiscreens/location_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes{
  static const String location = '/location';
  static const String loading = '/loading';
  static const String city = '/city';

 static Map <String, WidgetBuilder> routes = {
    '/location' :   (context) => LocationScreen(),
   '/loading' : (context) => LoadingScreen(),
   '/city' : (context) => CityScreen(),

};
}