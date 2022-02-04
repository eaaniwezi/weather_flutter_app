part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends WeatherEvent {}

class SearchCityEvent extends WeatherEvent {
  final String cityName;

  const SearchCityEvent({
    required this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}
