import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import 'package:intl/intl.dart';


String getWeatherAnimation(String? condition) {
  if (condition == null) return 'assets/sunny.json';
  switch (condition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/cloudy.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'assets/rain.json';
    case 'thunderstorm':
      return 'assets/thunder.json';
    case 'clear':
      return 'assets/sunny.json';
    default:
      return 'assets/sunny.json';
  }
}


Color getBackgroundColor(String? condition) {
  if (condition == null) return const Color(0xFFE3F2FD); // Soft blue
  switch (condition.toLowerCase()) {
    case 'clear':
      return const Color(0xFFFFF3E0); // Soft orange
    case 'clouds':
      return const Color(0xFFCFD8DC); // Soft grey-blue
    case 'rain':
    case 'drizzle':
      return const Color(0xFFB3E5FC); // Soft rain blue
    case 'thunderstorm':
      return const Color(0xFFD1C4E9); // Soft purple
    default:
      return const Color(0xFFE0E0E0); // Neutral grey
  }
}

@override
void initState() {
  super.initState();
  _fetchWeather();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: getBackgroundColor(_weather?.mainCondition),
  appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.transparent,
  title: const Text(
  "Weather App",
  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
  ),
  centerTitle: true,
  actions: [
  IconButton(
  icon: const Icon(Icons.refresh, color: Colors.black87),
  onPressed: () => _fetchWeather(),
  )
  ],
  ),
  body: SafeArea(
  child: Padding(
  padding: const EdgeInsets.all(16),
  child: _weather == null
  ? const Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
  child: Column(
  children: [
  // Search
