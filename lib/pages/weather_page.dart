import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import 'package:intl/intl.dart';



String getWeatherAnimation(String? condition) {
  if (condition == null) return 'assets/sunny.json';

