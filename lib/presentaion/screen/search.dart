import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_test/bussiness_logic/providers/weather_provider.dart';
import 'package:weather_test/deta/models/weather_model.dart';

import '../../helper/weather_services.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: TextField(
                  controller: dataController,
                  decoration: InputDecoration(
                    labelText: "Searching now",
                    suffixIcon: IconButton(
                        onPressed: () async {
                          WatherServices weatherServices = WatherServices();
                          WeatherModel model = await weatherServices.getWeather(
                              cityName: dataController.text);

                          String? name = weatherServices.nameOfCity;

                          Provider.of<WeatherProvider>(context, listen: false)
                              .weatherData = model;
                          Provider.of<WeatherProvider>(context, listen: false)
                              .name = name;

                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.search)),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (data) async {
                    WatherServices weatherServices = WatherServices();
                    WeatherModel model =
                        await weatherServices.getWeather(cityName: data);

                    String? name = weatherServices.nameOfCity;

                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = model;
                    Provider.of<WeatherProvider>(context, listen: false).name =
                        name;

                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
