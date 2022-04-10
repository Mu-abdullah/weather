import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_test/deta/models/weather_model.dart';

class WatherServices {
  var baseUrl = "https://www.metaweather.com/";
  String? nameOfCity;

  Future<int> getLocationId({required cityName}) async {
    Uri uri = Uri.parse("$baseUrl/api/location/search/?query=$cityName");
    http.Response response = await http.get(uri);

    List<dynamic> data = jsonDecode(response.body);
    int cityId = data[0]["woeid"];
    String name = data[0]["title"];
    nameOfCity = name;
    print(nameOfCity);
    print(cityId);
    return cityId;
  }

  Future<WeatherModel> getWeather({required cityName}) async {
    int id = await getLocationId(cityName: cityName);
    Uri url = Uri.parse("$baseUrl/api/location/$id/");
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    Map<String, dynamic> data = jsonData["consolidated_weather"][0];
    WeatherModel weatherModel = WeatherModel.fromJson(data);
    print(weatherModel);
    return weatherModel;
  }
}
