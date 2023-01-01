import 'package:flutter/material.dart';

import '../api/network_api.dart';
import '../models/location_model.dart';
import '../models/weather_model.dart';
import 'app_bar.dart';
import 'weather_box.dart';
import 'weather_details_box.dart';

 Widget currentWeatherViews(
      List<Location> locations, Location location, BuildContext context) {
    Weather _weather;

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _weather = snapshot.data as Weather;
          if (_weather == null) {
            return const Text("Error getting weather");
          } else {
            return Column(children: [
              createAppBar(locations, location, context),
              weatherBox(_weather),
              weatherDetailsBox(_weather),
            ]);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: Network.getCurrentWeather(location),
    );
  }