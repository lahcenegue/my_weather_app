import 'package:flutter/cupertino.dart';
import 'package:my_weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  set WeatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get WeatherData => _weatherData;
}
