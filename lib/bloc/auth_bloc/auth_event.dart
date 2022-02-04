part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class UserIsLoggedIn extends AuthEvent {
  final String lat;
  final String lon;
  final String cityName;

  const UserIsLoggedIn({
    required this.lat,
    required this.lon,
    required this.cityName,
  });

  @override
  List<Object> get props => [lat, lon, cityName];
}

class UserIsLoggedOut extends AuthEvent {}