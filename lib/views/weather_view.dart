import 'package:flutter/material.dart';
import 'package:weather_app/models/location_model.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/forecast_view_dayli.dart';
import '../widgets/forecast_view_hourly.dart';
import '../widgets/text_field.dart';

class CurrentWeatherPage extends StatefulWidget {
  final List<Location> locations;
  final BuildContext context;

  const CurrentWeatherPage(this.locations, this.context, {Key? key})
      : super(key: key);

  @override
  _CurrentWeatherPageState createState() =>
      _CurrentWeatherPageState(locations, context);
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final List<Location> locations;
  final Location location;
  @override
  final BuildContext context;

  //var cityController = TextEditingController(text: "Montpellier");

  _CurrentWeatherPageState(this.locations, this.context)
      : location = locations[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(children: <Widget>[
          createTextField(),
          currentWeatherViews(locations, location, context),
          forcastViewsHourly(location),
          forcastViewsDaily(location),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
