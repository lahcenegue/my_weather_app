import 'package:flutter/material.dart';
import 'package:my_weather_app/pages/home_page.dart';
import 'package:my_weather_app/provider/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<WeatherProvider>(
      create: (_) => WeatherProvider(), child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
