import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_test/bussiness_logic/providers/weather_provider.dart';
import 'package:weather_test/presentaion/screen/search.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<WeatherProvider>(context);
    var temp = provider.weatherData?.theTemp;
    var windSpeed = provider.weatherData?.windSpeed;
    var humidity = provider.weatherData?.humidity;
    var str = provider.weatherData?.created;
    late var newStr = str!.substring(0, 10) + ' ' + str.substring(11, 23);
    late DateTime dt = DateTime.parse(newStr);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            provider.weatherData == null ? Colors.white : Colors.black,
        title: Text(
            provider.weatherData == null ? "Search about your city" : "",
            style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ));
              },
              icon: Icon(
                Icons.search,
                color:
                    provider.weatherData == null ? Colors.black : Colors.white,
              ))
        ],
      ),
      body: provider.weatherData == null
          ? Container(
              height: height,
              width: width,
              color: Colors.white,
              child: const Center(
                child: Image(
                  image: AssetImage("assets/images/no_data.gif"),
                ),
              ),
            )
          : Container(
              height: height,
              width: width,
              color: Colors.black,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        "Hi,\nToday's ${DateFormat("EEEEEEE,\nd MMM yyyy \nHH:mm").format(dt)}",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: height * .5,
                            width: width * 8,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * .07,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: height * .3,
                                                width: width * 7,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: provider.weatherData!
                                                      .getCardColor(),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                          child: Text(
                                                            "${provider.name}",
                                                            style: TextStyle(
                                                              color: provider
                                                                  .weatherData!
                                                                  .getTextColor(),
                                                              fontSize: 28,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "min:\n${provider.weatherData!.minTemp!.round()}C",
                                                          style: TextStyle(
                                                            color: provider
                                                                .weatherData!
                                                                .getTextColor(),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${temp!.round()} C",
                                                          style: TextStyle(
                                                            color: provider
                                                                .weatherData!
                                                                .getTextColor(),
                                                            fontSize: 32,
                                                          ),
                                                        ),
                                                        Text(
                                                          "max:\n${provider.weatherData!.maxTemp!.round()}C",
                                                          style: TextStyle(
                                                            color: provider
                                                                .weatherData!
                                                                .getTextColor(),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "${provider.weatherData!.weatherStateName}",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: provider
                                                            .weatherData!
                                                            .getTextColor(),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Wind:\n${windSpeed!.round()}K/S",
                                                          style: TextStyle(
                                                            color: provider
                                                                .weatherData!
                                                                .getTextColor(),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Humidity:\n$humidity",
                                                          style: TextStyle(
                                                            color: provider
                                                                .weatherData!
                                                                .getTextColor(),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 15,
                                  top: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    maxRadius: 57,
                                    child: Image(
                                        image: AssetImage(
                                          provider.weatherData!.getImage(),
                                        ),
                                        height: height * .11),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
