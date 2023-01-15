import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/network_api.dart';
import 'package:weather_app/models/location_model.dart';
import '../bloc/weather_bloc.dart';
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
  var cityController = TextEditingController(text: "Montpellier");

  _CurrentWeatherPageState(this.locations, this.context)
      : location = locations[0];

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) => {
        if (state is SearchDoesntExist)
          {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 108, 63, 187),
                content:
                    Text('La ville que vous avez recherché n\'existe pas')))
          }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey[100],
            body: ListView(children: <Widget>[
              Row(children: [
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: createTextField(cityController, (() {
                      locations[0].city =
                          capitalize(cityController.text.trim());
                    })),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15, top: 5),
                  child: IconButton(
                    color: const Color.fromARGB(255, 108, 63, 187),
                    icon: const Icon(Icons.search),
                    iconSize: 30,
                    padding: const EdgeInsets.all(8.0),
                    onPressed: () {
                      weatherBloc.add(FetchWeatherEvent(location));
                    },
                  ),
                ),
              ]),
              currentWeatherViews(locations, location, context),
              forcastViewsHourly(location),
              forcastViewsDaily(location),
            ]));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
