import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/weather.dart';
import '../data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._weatherRepository) : super(WeatherInitial());

  final WeatherRepository _weatherRepository;
  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      try {
        yield WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);

        yield WeatherLoaded(weather);
      } on NetworkException catch (_) {
        yield WeatherError("Could't fetch weather. Is the device online?");
      }
    }
  }
}
