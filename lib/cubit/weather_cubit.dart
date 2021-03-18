import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/model/weather.dart';
import 'package:flutter_bloc_example/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  final WeatherRepository _weatherRepository;

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);

      emit(WeatherLoaded(weather));
    } on NetworkException catch (_) {
      emit(WeatherError("Could't fetch weather. Is the device online?"));
    }
  }
}
