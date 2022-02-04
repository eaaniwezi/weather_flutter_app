// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/models/searched_city_model.dart';

import 'package:weather_flutter_app/repository/auth_repository.dart';
import 'package:weather_flutter_app/repository/weather_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final WeatherRepository weatherRepository;
  AuthBloc({
    required AuthState initialState,
    required this.authRepository,
    required this.weatherRepository,
  })  : assert(authRepository != null),
        super(initialState) {
    add(AppStarted());
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool isCityPicked = await authRepository.hasCity();
      if (isCityPicked) {
        try {
          late final SearchedCityModel _searchedCityModel;
          _searchedCityModel = await weatherRepository.fetchWeatherData();
          final savedCity = await weatherRepository.getCityName();
          yield UserAuthenticated(
            searchedCityModel: _searchedCityModel,
            cityName: savedCity.toString(),
          );
        } catch (e) {
          yield ErrorFetchingWeatherData(
              error: "Error Fetching weather details");
        }
      } else {
        yield UserUnauthenticated();
      }
    }
    if (event is UserIsLoggedIn) {
      await authRepository.persistUser(
        event.lat,
        event.lon,
        event.cityName,
      );
      try {
        late final SearchedCityModel _searchedCityModel;
        _searchedCityModel = await weatherRepository.fetchWeatherData();
        final savedCity = await weatherRepository.getCityName();
        yield UserAuthenticated(
          searchedCityModel: _searchedCityModel,
          cityName: savedCity.toString(),
        );
      } catch (e) {
        yield ErrorFetchingWeatherData(error: "Error Fetching weather details");
      }
    }
    if (event is UserIsLoggedOut) {
      await authRepository.logout();
      yield UserUnauthenticated();
    }
  }
}
