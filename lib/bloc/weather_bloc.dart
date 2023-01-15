import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/bloc/weather_repo.dart';
import 'package:weather_app/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        final  weather = await weatherRepo.getWeather(event._city);
        if (weather != null) {
          emit(WeatherIsLoaded(weather));
        } else {
          emit(SearchDoesntExist());
        }
      } catch (_) {
        print("Error: $_");
        emit(WeatherIsNotLoaded());
      }
    });

    on<ResetWeather>((event, emit) async {
      emit(WeatherIsNotSearched());
    });
  }
}
