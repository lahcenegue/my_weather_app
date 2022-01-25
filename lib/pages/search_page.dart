import 'package:flutter/material.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/providers/weather_provider.dart';
import 'package:my_weather_app/services/weather_service.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});

  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search a City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (data) async {
                cityName = data;

                WeatherService service = WeatherService();

                WeatherModel weather =
                    await service.getWeather(cityName: cityName!);

                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;

                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                label: Text('Search'),
                border: OutlineInputBorder(),
                hintText: 'Enter a city',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ));
  }
}
