part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class UserUninitialized extends AuthState {}

class UserUnauthenticated extends AuthState {}

class UserAuthenticated extends AuthState {
  final SearchedCityModel searchedCityModel;
  final String cityName;
  const UserAuthenticated({
    required this.searchedCityModel,
    required this.cityName,
  });
}

class ErrorFetchingWeatherData extends AuthState {
  final String error;
  const ErrorFetchingWeatherData({
    required this.error,
  });
}

// //*

// class FetchingWeatherData extends AuthState {}

// class SuccessfullyFetchedWeatherData extends AuthState {
//   final SearchedCityModel searchedCityModel;
//   const SuccessfullyFetchedWeatherData({
//     required this.searchedCityModel,
//   });
// }

// class ErrorFetchingWeatherData extends AuthState {
//   final String error;
//   const ErrorFetchingWeatherData({
//     required this.error,
//   });
// }
