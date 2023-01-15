part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final _city;

  FetchWeatherEvent(this._city);

  @override
  List<Object> get props => [_city];
}

class WeatherIsLoadingEvent extends WeatherEvent {}

class WeatherIsNotLoadedEvent extends WeatherEvent {}

class ResetWeather extends WeatherEvent {}

class SearchDoesntExistEvent extends WeatherEvent {}