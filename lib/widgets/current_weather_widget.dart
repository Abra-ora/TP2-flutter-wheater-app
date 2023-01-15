import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

import '../api/network_api.dart';
import '../models/location_model.dart';
import '../models/weather_model.dart';
import 'app_bar.dart';
import 'weather_box.dart';
import 'weather_details_box.dart';

Widget currentWeatherViews(
    List<Location> locations, Location location, BuildContext context) {
  Weather _weather;


  showScaffoldMessenger(){
    return const ScaffoldMessenger(
        child: SnackBar(content: Text('La ville que vous avez recherché n\'existe pas')));
  }
  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        _weather = snapshot.data as Weather;
        return Column(children: [
          createAppBar(locations, location, context),
          weatherBox(_weather),
          weatherDetailsBox(_weather),
        ]);
      } else {
        showScaffoldMessenger();
        return const Center(heightFactor: 10 , child: CircularProgressIndicator());
      }
    },
    future: Network.getCurrentWeather(location),
  );
}
