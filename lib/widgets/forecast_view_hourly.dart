import 'package:flutter/material.dart';
import '../api/network_api.dart';
import '../models/forecast_model.dart';
import '../models/location_model.dart';
import 'hourly_box.dart';

Widget forcastViewsHourly(Location location) {
  Forecast _forcast;

  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        _forcast = snapshot.data as Forecast;
        if (_forcast == null) {
          return const Text("Error getting weather");
        } else {
          return hourlyBoxes(_forcast);
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: Network.getForecast(location),
  );
}
