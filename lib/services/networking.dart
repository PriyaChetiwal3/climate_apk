//
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// class NetworkHelper {
//   dynamic url;
//
//   NetworkHelper(this.url) {
//     url =
//     "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid=09ac7795ea2f7a3c6c4fab17ef3dea18&q=london ";
//     Future<void> getData() async {
//       http.Response response = await http.get(url);
//       if (response.statusCode == 200) {
//         String data = response.body;
//         // var decodeData = jsonDecode(data);
//         return jsonDecode(data);
//       }
//       else {
//         print(response.statusCode);
//       }
//
//       // latitude = location.latitude;
//       // longitude = location.longitude;
//       //
//       // NetworkHelper networkHelper = NetworkHelper(
//       //     ""
//       // );
//       // var weatherData = await networkHelper.getData();
//       // Navigator.pushNamed(context, Routes.location);
//       // ))
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

dynamic url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}