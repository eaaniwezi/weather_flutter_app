part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class SearchingCityCordinates extends WeatherState {}

class SearchedCityCordinates extends WeatherState {
  final SearchedCityCordinateModel searchedCityCordinateModel;
  const SearchedCityCordinates({
    required this.searchedCityCordinateModel,
  });
}

class SearchCityFailure extends WeatherState {
  final String error;

  const SearchCityFailure({required this.error});
}
