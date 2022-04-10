import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_test/bussiness_logic/providers/weather_provider.dart';
import 'package:weather_test/constants/colors.dart';
import 'package:weather_test/presentaion/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple,
        ),
        home: Home(),
      ),
    );
  }
}
