import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_weather_app/models/weather_model.dart';

class WeatherService {
  Future<int> getCityId({required String cityName}) async {
    String baseURL = 'https://www.metaweather.com';
    Uri url = Uri.parse('$baseURL/api/location/search/?query=$cityName');

    http.Response response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);

    int cityId = data[0]['woeid'];
    return cityId;
  }

  Future getWeather({required String cityName}) async {
    int id = await getCityId(cityName: cityName);

    String baseURL = 'https://www.metaweather.com';
    Uri url = Uri.parse('$baseURL/api/location/$id');

    http.Response response = await http.get(url);

    Map<String, dynamic> jsondata = jsonDecode(response.body);

    Map<String, dynamic> data = jsondata["consolidated_weather"][0];

    WeatherModel weatherData = WeatherModel.fromJson(data);

    return weatherData;

    // print('tempirateur est: $tem');
  }
}
