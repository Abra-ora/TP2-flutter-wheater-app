import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_repo.dart';
import 'package:weather_app/models/location_model.dart';
import 'package:weather_app/views/weather_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Location> locations = [
      Location(
          city: "Montpellier", country: "France", lat: "43.6109", lon: "3.8772")
    ];

    final WeatherBloc weatherBloc = WeatherBloc(WeatherRepo());
    return MaterialApp(
        title: 'Weather Forecast',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider.value(
          value: weatherBloc,
          child: CurrentWeatherPage(locations, context),
        )
        );
  }
}
