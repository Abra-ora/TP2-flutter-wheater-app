import 'daily_model.dart';
import 'hourly_model.dart';

class Forecast {
  final List<Hourly> hourly;
  final List<Daily> daily;

  Forecast({required this.hourly, required this.daily});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];
    List<dynamic> dailyData = json['daily'];

    List<Hourly> hourly = [];
    List<Daily> daily = [];

    for (var item in hourlyData) {
      var hour = Hourly.fromJson(item);
      hourly.add(hour);
    }

    for (var item in dailyData) {
      var day = Daily.fromJson(item);
      daily.add(day);
    }

    return Forecast(hourly: hourly, daily: daily);
  }
}
