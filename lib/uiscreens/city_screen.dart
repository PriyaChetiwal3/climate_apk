import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                onPressed: () {Navigator.pop(context,Routes.city);},
                child: Icon(Icons.arrow_back),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  cityName = value;
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your City Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: Text("Get Weather"),
            )
          ],
        ),
      ),
    );
  }
}
