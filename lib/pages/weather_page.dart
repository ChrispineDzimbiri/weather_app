import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import 'package:intl/intl.dart';

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
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search City",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      _fetchWeather(_searchController.text);
                    },
                    child: const Text("Go"),
                  )
                ],
              ),
              const SizedBox(height: 24),

              // City & Time
              Text(
                _weather!.cityName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                DateFormat('EEEE, MMM d • hh:mm a').format(DateTime.now()),
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),

              const SizedBox(height: 12),

              // Weather animation
              SizedBox(
                height: 180,
                child: Lottie.asset(getWeatheranimation(_weather?.mainCondition)),
              ),

              // Temperature
              Text(
                '${_weather!.temperature.round()}°C',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              // Condition
              Text(
                _weather!.mainCondition,
                style: const TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              // Weather Details
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Humidity", style: TextStyle(fontSize: 16, color: Colors.black87)),
                          Text("78%", style: TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Wind Speed", style: TextStyle(fontSize: 16, color: Colors.black87)),
                          Text("14 km/h", style: TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Pressure", style: TextStyle(fontSize: 16, color: Colors.black87)),
                          Text("1013 hPa", style: TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}