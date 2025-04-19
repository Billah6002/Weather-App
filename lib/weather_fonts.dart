import 'package:flutter/widgets.dart';

class WeatherIconsCustom {
  static const String _fontFamily = 'weathericons';

  static const IconData daySunny         = IconData(0xf00d, fontFamily: _fontFamily);
  static const IconData nightClear       = IconData(0xf02e, fontFamily: _fontFamily);
  static const IconData dayCloudy        = IconData(0xf002, fontFamily: _fontFamily);
  static const IconData nightAltCloudy   = IconData(0xf086, fontFamily: _fontFamily);
  static const IconData cloud            = IconData(0xf041, fontFamily: _fontFamily);
  static const IconData cloudy           = IconData(0xf013, fontFamily: _fontFamily);
  static const IconData showers          = IconData(0xf01a, fontFamily: _fontFamily);
  static const IconData dayRain          = IconData(0xf008, fontFamily: _fontFamily);
  static const IconData nightAltRain     = IconData(0xf028, fontFamily: _fontFamily);
  static const IconData thunderstorm     = IconData(0xf01e, fontFamily: _fontFamily);
  static const IconData snow             = IconData(0xf01b, fontFamily: _fontFamily);
  static const IconData fog              = IconData(0xf014, fontFamily: _fontFamily);
  static const IconData na               = IconData(0xf07b, fontFamily: _fontFamily);
  IconData getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case '01d':
        return WeatherIconsCustom.daySunny;
      case '01n':
        return WeatherIconsCustom.nightClear;
      case '02d':
        return WeatherIconsCustom.dayCloudy;
      case '02n':
        return WeatherIconsCustom.nightAltCloudy;
      case '03d':
      case '03n':
        return WeatherIconsCustom.cloud;
      case '04d':
      case '04n':
        return WeatherIconsCustom.cloudy;
      case '09d':
      case '09n':
        return WeatherIconsCustom.showers;
      case '10d':
        return WeatherIconsCustom.dayRain;
      case '10n':
        return WeatherIconsCustom.nightAltRain;
      case '11d':
      case '11n':
        return WeatherIconsCustom.thunderstorm;
      case '13d':
      case '13n':
        return WeatherIconsCustom.snow;
      case '50d':
      case '50n':
        return WeatherIconsCustom.fog;
      default:
        return WeatherIconsCustom.na;
    }
  }
}

