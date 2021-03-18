part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.weather);
  final Weather weather;
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherError extends WeatherState {
  const WeatherError(this.message);
  final String message;
}
