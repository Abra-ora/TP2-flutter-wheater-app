import 'package:flutter/material.dart';
import 'package:weather_app/extensions.dart';
import 'package:weather_app/utils/clipper.dart';
import 'package:weather_app/widgets/weather_icon.dart';

import '../models/weather_model.dart';


  Widget weatherBox(Weather _weather) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          height: 160.0,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 108, 63, 187),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 108, 63, 187),
                    offset: Offset(0, 2),
                    blurRadius: 10.0)
              ]),
          ),
        ClipPath(
            clipper: Clipper(),
            child: Container(
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.all(15.0),
                height: 160.0,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 71, 31, 94),
                    borderRadius: BorderRadius.all(Radius.circular(20))))),
        Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          height: 160.0,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getWeatherIcon(_weather.icon),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Text(
                          _weather.description.capitalizeFirstOfEach,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white),
                        )),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Text(
                          "H:${_weather.high.toInt()}° L:${_weather.low.toInt()}°",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Colors.white),
                        )),
                  ]),
            ),
            Column(children: <Widget>[
              Text(
                "${_weather.temp.toInt()}°",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.white),
              ),
              Container(
                  margin: const EdgeInsets.all(0),
                  child: Text(
                    "Feels like ${_weather.feelsLike.toInt()}°",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.white),
                  )),
            ])
          ]),
        ),
      ],
    );
  }