// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:weather_flutter_app/models/searched_city_cordinate_model.dart';
import 'package:weather_flutter_app/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  final AuthBloc authBloc;

  WeatherBloc({
    required WeatherState initialState,
    required this.weatherRepository,
    required this.authBloc,
  })  : assert(weatherRepository != null),
        assert(authBloc != null),
        super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is SearchCityEvent) {
      yield SearchingCityCordinates();
      try {
        late final SearchedCityCordinateModel _searchedCityCordinateModel;
        _searchedCityCordinateModel =
            await weatherRepository.getCityCordinates(cityName: event.cityName);
        authBloc.add(UserIsLoggedIn(
          lat: _searchedCityCordinateModel.lat.toString(),
          lon: _searchedCityCordinateModel.lon.toString(),
          cityName: _searchedCityCordinateModel.name.toString(),
        ));
        yield SearchedCityCordinates(
            searchedCityCordinateModel: _searchedCityCordinateModel);
      } catch (e) {
        yield SearchCityFailure(error: "Couldn't find city");
      }
    }

  } 
}
