import 'package:flutter/material.dart';
import 'pages/weather_page.dart';



void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: WeatherPage(),
    );
  }
}
