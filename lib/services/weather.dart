
import 'location.dart';
import 'networking.dart';

class WeatherModel {
 Future<dynamic> getCityWeather(String cityName) async{
    var url = '';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.url;
    return weatherData;

  }
 static Future<dynamic> getLocationWeather() async {
    Location location = Location() ;
    await Location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid=09ac7795ea2f7a3c6c4fab17ef3dea18&q=london ");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}

String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '%';
  } else if (condition < 400) {
    return "3";
  } else if (condition < 700) {
    return "&";
  } else if (condition < 800) {
    return "@";
  } else if (condition == 800) {
    return "*";
  } else {
    return "dont no";
  }
}

String getMessage(int temp) {
  if (temp > 25) {
    return "its ice cream time";
  } else if (temp > 20) {
    return ("its rainy time");
  } else if (temp < 10) {
    return ("its winter time");
  } else if (temp < 25) {
    return "its summer time";
  } else if (temp > 25) {
    return "its starting of winter";
  } else {
    return ("default value");
  }
}



// import 'location.dart';
// import 'networking.dart';
//
// const apiKey = 'e72ca729af228beabd5d20e3b7749713';
// const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
//
// class WeatherModel {
//   Future<dynamic> getCityWeather(String cityName) async {
//     NetworkHelper networkHelper = NetworkHelper(
//         '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
//
//     var weatherData = await networkHelper.getData();
//     return weatherData;
//   }
//
//   Future<dynamic> getLocationWeather() async {
//     Location location = Location();
//     await location.getCurrentLocation();
//
//     NetworkHelper networkHelper = NetworkHelper(
//         '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
//
//     var weatherData = await networkHelper.getData();
//     return weatherData;
//   }
//
//   String getWeatherIcon(int condition) {
//     if (condition < 300) {
//       return '🌩';
//     } else if (condition < 400) {
//       return '🌧';
//     } else if (condition < 600) {
//       return '☔️';
//     } else if (condition < 700) {
//       return '☃️';
//     } else if (condition < 800) {
//       return '🌫';
//     } else if (condition == 800) {
//       return '☀️';
//     } else if (condition <= 804) {
//       return '☁️';
//     } else {
//       return '🤷‍';
//     }
//   }
//
//   String getMessage(int temp) {
//     if (temp > 25) {
//       return 'It\'s 🍦 time';
//     } else if (temp > 20) {
//       return 'Time for shorts and 👕';
//     } else if (temp < 10) {
//       return 'You\'ll need 🧣 and 🧤';
//     } else {
//       return 'Bring a 🧥 just in case';
//     }
//   }
// }