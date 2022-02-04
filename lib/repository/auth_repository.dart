// ignore_for_file: prefer_const_constructors

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<void> persistUser(String lat, String lon, String cityName) async {
    await storage.write(key: 'lat', value: lat);
    await storage.write(key: 'lon', value: lon);
    await storage.write(key: 'cityName', value: cityName);
  }

  Future<bool> hasCity() async {
    var lat = await storage.read(key: 'lat');
    var lon = await storage.read(key: 'lon');
    var cityName = await storage.read(key: 'cityName');
    if ((lat != null) && (lon != null) && (cityName != null)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    storage.delete(key: 'lat');
    storage.delete(key: 'lon');
    storage.delete(key: 'cityName');
    storage.deleteAll();
  }
}
