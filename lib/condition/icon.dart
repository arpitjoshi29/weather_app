import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconAccordingToWeather {
  Icon getWeatherIcon(int condition) {
    if (condition < 300) {
      return Icon(FontAwesomeIcons.cloudRain, color: Colors.white);
    } else if (condition < 400) {
      return Icon(FontAwesomeIcons.cloudRain, color: Colors.white);
    } else if (condition < 600) {
      return Icon(FontAwesomeIcons.umbrella, color: Colors.white);
    } else if (condition < 700) {
      return Icon(FontAwesomeIcons.snowflake, color: Colors.white);
    } else if (condition < 800) {
      return Icon(Icons.filter_drama, color: Colors.white);
    } else if (condition == 800) {
      return Icon(Icons.wb_sunny, color: Colors.white);
    } else if (condition <= 804) {
      return Icon(FontAwesomeIcons.cloud, color: Colors.white);
    } else {
      return Icon(FontAwesomeIcons.confluence, color: Colors.white);
    }
  }
}
