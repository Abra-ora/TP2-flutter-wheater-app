import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/location_model.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepo {
  static String lang = "fr";
  static String units = "metric";
  static String cnt = "7";
  static String appid = "60a157096d1ea34e43592b7be7ed30c3";

  Future<Weather?> getWeather(Location location) async {
    String cityName = location.city;
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appid&units=$units&lang=$lang";
    var response = await http.Client().get(Uri.parse(finalUrl));
    if (response.statusCode != 200) {
      return null;
    }
    return Weather.fromJson(jsonDecode(response.body));
  }
}
