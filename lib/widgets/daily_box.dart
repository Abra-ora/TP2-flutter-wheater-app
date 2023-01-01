import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_icon_small.dart';

import '../models/forecast_model.dart';
import '../utils/utils.dart';


 Widget dailyBoxes(Forecast _forcast) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
            itemCount: _forcast.daily.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, bottom: 5, right: 10),
                  margin: const EdgeInsets.all(5),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      getDateFromTimestamp(_forcast.daily[index].dt),
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    )),
                    Expanded(
                        child: getWeatherIconSmall(_forcast.daily[index].icon)),
                    Expanded(
                        child: Text(
                      "${_forcast.daily[index].high.toInt()}/${_forcast.daily[index].low.toInt()}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    )),
                  ]));
            }));
  }
