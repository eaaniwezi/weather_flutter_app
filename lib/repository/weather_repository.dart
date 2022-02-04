// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:weather_flutter_app/models/searched_city_cordinate_model.dart';
import 'package:weather_flutter_app/models/searched_city_model.dart';

class WeatherRepository {
  var log = Logger();
  static const baseUrl = 'http://api.openweathermap.org';
  static const apiKey = "";
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<SearchedCityCordinateModel> getCityCordinates(
      {required String cityName}) async {
    var response = await http.get(
      Uri.parse("$baseUrl/geo/1.0/direct?q=$cityName&appid=$apiKey"),
    );
    final cityData = jsonDecode(response.body);
    return SearchedCityCordinateModel.fromJson(cityData[0]);
  }

  Future<SearchedCityModel> fetchWeatherData() async {
    var lat = await storage.read(key: 'lat');
    var lon = await storage.read(key: 'lon');
    var response = await http.get(
      Uri.parse(
          "$baseUrl/data/2.5/onecall?lat=$lat&lon=$lon&exclude=alerts,minutely&appid=$apiKey&units=metric&lang=ru"),
    );
    final cityData = jsonDecode(response.body);
    return SearchedCityModel.fromJson(cityData);
  }

  Future<String?> getCityName() async {
    var cityName = await storage.read(key: 'cityName');
    return cityName;
  }
}
