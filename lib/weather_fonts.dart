import 'package:flutter/widgets.dart';

class WeatherIconsCustom {
  static const String _fontFamily = 'weathericons';

  // Neutral icons you already have:
  static const IconData cloud        = IconData(0xf041, fontFamily: _fontFamily);
  static const IconData cloudy       = IconData(0xf013, fontFamily: _fontFamily);
  static const IconData showers      = IconData(0xf01a, fontFamily: _fontFamily);
  static const IconData thunderstorm = IconData(0xf01e, fontFamily: _fontFamily);
  static const IconData snow         = IconData(0xf01b, fontFamily: _fontFamily);
  static const IconData fog          = IconData(0xf014, fontFamily: _fontFamily);
  static const IconData na           = IconData(0xf07b, fontFamily: _fontFamily);

  // Daytime icons
  static const IconData daySunny           = IconData(0xf00d, fontFamily: _fontFamily);
  static const IconData dayCloudy          = IconData(0xf002, fontFamily: _fontFamily);
  static const IconData dayCloudyGusts     = IconData(0xf000, fontFamily: _fontFamily);
  static const IconData dayCloudyWindy     = IconData(0xf001, fontFamily: _fontFamily);
  static const IconData dayShowers         = IconData(0xf009, fontFamily: _fontFamily);
  static const IconData dayRain            = IconData(0xf008, fontFamily: _fontFamily);
  static const IconData dayRainMix         = IconData(0xf006, fontFamily: _fontFamily);
  static const IconData dayRainWind        = IconData(0xf007, fontFamily: _fontFamily);
  static const IconData dayStormShowers    = IconData(0xf00e, fontFamily: _fontFamily);
  static const IconData dayThunderstorm    = IconData(0xf010, fontFamily: _fontFamily);
  static const IconData daySnow            = IconData(0xf00a, fontFamily: _fontFamily);
  static const IconData daySprinkle        = IconData(0xf00b, fontFamily: _fontFamily);
  static const IconData dayFog             = IconData(0xf003, fontFamily: _fontFamily);

  // Nighttime icons
  static const IconData nightClear             = IconData(0xf02e, fontFamily: _fontFamily);
  static const IconData nightAltCloudy         = IconData(0xf086, fontFamily: _fontFamily); // your existing
  static const IconData nightCloudy            = IconData(0xf031, fontFamily: _fontFamily);
  static const IconData nightAltCloudyGusts    = IconData(0xf022, fontFamily: _fontFamily);
  static const IconData nightAltCloudyWindy    = IconData(0xf023, fontFamily: _fontFamily);
  static const IconData nightShowers           = IconData(0xf037, fontFamily: _fontFamily);
  static const IconData nightAltShowers        = IconData(0xf029, fontFamily: _fontFamily);
  static const IconData nightRain              = IconData(0xf036, fontFamily: _fontFamily);
  static const IconData nightAltRain           = IconData(0xf028, fontFamily: _fontFamily);
  static const IconData nightStormShowers      = IconData(0xf03a, fontFamily: _fontFamily);
  static const IconData nightAltStormShowers   = IconData(0xf02c, fontFamily: _fontFamily);
  static const IconData nightThunderstorm      = IconData(0xf03b, fontFamily: _fontFamily);
  static const IconData nightAltThunderstorm   = IconData(0xf02d, fontFamily: _fontFamily);
  static const IconData nightSnow              = IconData(0xf038, fontFamily: _fontFamily);
  static const IconData nightAltSnow           = IconData(0xf02a, fontFamily: _fontFamily);
  static const IconData nightSprinkle          = IconData(0xf039, fontFamily: _fontFamily);
  static const IconData nightFog               = IconData(0xf04a, fontFamily: _fontFamily);

  IconData getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case '01d': return daySunny;
      case '01n': return nightClear;

      case '02d': return dayCloudy;
      case '02n': return nightAltCloudy;

      case '03d': return dayCloudyGusts;     // scattered clouds (day) :contentReference[oaicite:0]{index=0}
      case '03n': return nightAltCloudyGusts; // scattered clouds (night) :contentReference[oaicite:1]{index=1}

      case '04d': return dayCloudyWindy;     // broken clouds (day) :contentReference[oaicite:2]{index=2}
      case '04n': return nightAltCloudyWindy; // broken clouds (night) :contentReference[oaicite:3]{index=3}

      case '09d': return dayShowers;         // showers (day) :contentReference[oaicite:4]{index=4}
      case '09n': return nightAltShowers;    // showers (night) :contentReference[oaicite:5]{index=5}

      case '10d': return dayRain;
      case '10n': return nightAltRain;

      case '11d': return dayThunderstorm;    // thunderstorm (day) :contentReference[oaicite:6]{index=6}
      case '11n': return nightAltThunderstorm; // :contentReference[oaicite:7]{index=7}

      case '13d': return daySnow;            // snow (day) :contentReference[oaicite:8]{index=8}
      case '13n': return nightAltSnow;       // snow (night) :contentReference[oaicite:9]{index=9}

      case '50d': return dayFog;             // mist/fog (day) :contentReference[oaicite:10]{index=10}
      case '50n': return nightFog;           // mist/fog (night) :contentReference[oaicite:11]{index=11}

      default:   return na;
    }
  }
}
