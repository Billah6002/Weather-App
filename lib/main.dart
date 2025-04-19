import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart';
import 'package:weather_app/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      isDarkMode: isDarkMode,
      toggleTheme: toggleTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDarkMode
            ? ThemeData.dark(useMaterial3: true)
            : ThemeData.light(useMaterial3: true),
        title: 'Weather App',
        home: const WeatherScreen(),
      ),
    );
  }
}
