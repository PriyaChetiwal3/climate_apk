import 'package:climate_apk/services/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather =  WeatherModel();
  late int temperature;
 late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null){
        temperature = 0;
      cityName = "";
      weatherMessage = 'error';
      weatherIcon = "3";
      return;

      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherMessage = WeatherModel.getLocationWeather() as String;
      weatherIcon = WeatherModel.getLocationWeather() as String;
      cityName = weatherData['name'];
    } );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
color: Colors.grey,
        // decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('asset/location_background.jpg'),
            // fit: BoxFit.cover,
            // color: ColorFilter.mode(Colors.white.withOpacity(0.8))
          // ),
        // ),
        // constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      var weatherData = await WeatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: ()async {
                     var typeName = await Navigator.pushNamed(context, Routes.city);
                     print (typeName);
                     if (typeName != null){
                       var weatherData = await weather.getCityWeather('typeName');
                       updateUI(weatherData);

                     }
                    },

                    child: Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),

                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      "$weatherIcon",
                    ),
                    Text("$weatherMessage"),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text("Its time in san Francisco!",
                          textAlign: TextAlign.right),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// double temperature  = decodeData['main'] ['temp'];
// int condition = decodeData['weather'][0]['id'];
// String cityName = decodeData['name'];
