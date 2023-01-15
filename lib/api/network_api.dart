import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/models/location_model.dart';
import 'package:weather_app/models/weather_model.dart';

class Network {
  static String lang = "fr";
  static String units = "metric";
  static String cnt = "7";
  static String appid = "60a157096d1ea34e43592b7be7ed30c3";

  static Future<Weather> getWeatherForecast({required String cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&lang=$lang&units=$units&cnt=$cnt&appid=$appid";

    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting $cityName weather forecast");
    }
  }

  static Future getCurrentWeather(Location location) async {
    String cityName = location.city;
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appid&units=$units&lang=$lang";

    final response = await http.get(Uri.parse(finalUrl));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting $cityName weather forecast");
    }
  }

  static Future getForecast(Location location) async {
    String lat = location.lat;
    String lon = location.lon;
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$appid&units=$units&lang=$lang";

    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting {lat:$lat;lon:$lon} weather forecast");
    }
  }
}
