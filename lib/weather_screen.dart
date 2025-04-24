import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/apikey.dart';
import 'package:weather_app/hourly_forecast.dart';
import 'package:weather_app/theme_provider.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather_fonts.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final List<String> cities = [
    'London',
    'Paris',
    'New York',
    'Tokyo',
    'Dubai',
    'Singapore',
    'Berlin',
    'Mumbai',
    'Sydney',
    'Toronto',
    'Gazipur'
  ];
  String selectedCity = 'Gazipur'; // default city

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = selectedCity;
      final response = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey"),
      );

      if (response.statusCode != 200) {
        // print("API Error - Status Code: ${response.statusCode}");
        // print("Response body: ${response.body}");
        throw "API Error: Status ${response.statusCode}";
      }

      final data = jsonDecode(response.body);

      if (data["cod"] != "200") {
        // print("Weather API Error: ${data['message']}");
        throw "Weather API Error: ${data['message'] ?? 'Unknown error occurred'}";
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  WeatherIconsCustom getIcons = WeatherIconsCustom();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              final themeProvider = ThemeProvider.of(context);
              if (themeProvider != null) {
                themeProvider.toggleTheme();
              }
            },
            icon: ThemeProvider.of(context)!.isDarkMode ? Icon(Icons.dark_mode_outlined) : Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final data = snapshot.data!;
            final currentTemperature = data['list'][0]["main"]["temp"];
            final currentHumidity = data['list'][0]["main"]["humidity"];
            final currentPressure = data['list'][0]["main"]["pressure"];
            final currentWindSpeed = data['list'][0]["wind"]["speed"];
            final currentCloud = data['list'][0]["weather"][0]['main'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: selectedCity,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCity = newValue!;
                      });
                    },
                    items: cities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "$currentTemperature K",
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Icon(
                                  getIcons.getWeatherIcon(
                                      data['list'][0]["weather"][0]['icon']),
                                  size: 64,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  currentCloud,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Weather Forecast",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: data['cnt'] - 1,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final datetime =
                            DateTime.parse(data['list'][index + 1]["dt_txt"]);
                        final temperature =
                            data['list'][index + 1]["main"]['temp'];
                        // print('Sunset : ${sunset}');
                        // print(data['list'][index + 1]["dt"]);

                        return HourlyForeCast(
                          time: DateFormat.j().format(datetime),
                          temperature: temperature.toString(),
                          icon: getIcons.getWeatherIcon(
                              data['list'][index + 1]["weather"][0]['icon']),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Additional Information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      spacing: 20,
                      children: [
                        AdditionalInfoItem(
                          icon: Icon(Icons.water_drop_outlined, size: 40),
                          condition: "Humidity",
                          value: currentHumidity.toString(),
                        ),
                        AdditionalInfoItem(
                          icon: Icon(Icons.air_rounded, size: 40),
                          condition: "Wind Speed",
                          value: currentWindSpeed.toString(),
                        ),
                        AdditionalInfoItem(
                          icon: Icon(Icons.beach_access_sharp, size: 40),
                          condition: "Pressure",
                          value: currentPressure.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
