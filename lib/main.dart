// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:weather_flutter_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_flutter_app/repository/auth_repository.dart';
import 'package:weather_flutter_app/repository/weather_repository.dart';
import 'package:weather_flutter_app/screens/home_screen.dart';
import 'package:weather_flutter_app/screens/welcome_screen.dart';
import 'package:weather_flutter_app/widgets/error_indicator_widget.dart';
import 'package:weather_flutter_app/widgets/loading_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final weatherRepository = WeatherRepository();
  final authRepository = AuthRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) {
          return AuthBloc(
            authRepository: authRepository,
            initialState: AuthInitial(),
            weatherRepository: weatherRepository,
          )..add(AppStarted());
        },
      ),
      BlocProvider<WeatherBloc>(
        create: (context) {
          return WeatherBloc(
            initialState: WeatherInitial(),
            weatherRepository: weatherRepository,
            authBloc: BlocProvider.of<AuthBloc>(context),
          );
        },
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(41, 61, 74, .1),
      100: Color.fromRGBO(41, 61, 74, .2),
      200: Color.fromRGBO(41, 61, 74, .3),
      300: Color.fromRGBO(41, 61, 74, .4),
      400: Color.fromRGBO(41, 61, 74, .5),
      500: Color.fromRGBO(41, 61, 74, .6),
      600: Color.fromRGBO(41, 61, 74, .7),
      700: Color.fromRGBO(41, 61, 74, .8),
      800: Color.fromRGBO(41, 61, 74, .9),
      900: Color.fromRGBO(41, 61, 74, 1),
    };
    MaterialColor colorCustom = MaterialColor(0xFF293D4A, color);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather-App',
        theme: ThemeData(
          primarySwatch: colorCustom,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UserUnauthenticated) {
              return WelcomeScreen();
            } else if (state is UserAuthenticated) {
              return HomeScreen();
            } else if (state is ErrorFetchingWeatherData) {
              return ErrorIndicatorWidget();
            }
            return LoadingWidget();
          },
        ));
  }
}
