

import 'package:flutter/foundation.dart';
import 'package:weather_test/deta/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherProvider ;
  String? name;

  set weatherData (WeatherModel? weather){
    _weatherProvider = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData  => _weatherProvider;
}