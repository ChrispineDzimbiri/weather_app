import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:http/http.dart' as http;

class WeatherService{
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

  final String apiKey;
}