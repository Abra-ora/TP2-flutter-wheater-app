import 'package:flutter/material.dart';
import 'package:weather_app/widgets/daily_box.dart';

import '../api/network_api.dart';
import '../models/forecast_model.dart';
import '../models/location_model.dart';


  Widget forcastViewsDaily(Location location) {
    Forecast _forcast;

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _forcast = snapshot.data as Forecast;
          if (_forcast == null) {
            return const Text("Error getting weather");
          } else {
            return dailyBoxes(_forcast);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: Network.getForecast(location),
    );
  }
