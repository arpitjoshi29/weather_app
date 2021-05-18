import 'package:weather/condition/time.dart';

GetTime getTime = GetTime();

class BackGroundImage {
  String name;
  String getImage(String condition) {
    if (condition == 'Clear') {
      name = 'clear.jpg';
    } else if (condition == 'Somke') {
      name = 'cloudy.jpg';
    } else if (condition == 'Rain') {
      name = 'rainy.jpg';
    } else if (condition == 'Snow') {
      name = 'snow.jpg';
    } else if (condition == 'Clouds') {
      name = 'cloud.jpg';
    } else if (condition == 'Haze') {
      name = 'cloudy.jpg';
    } else {
      name = 'cloudy.jpg';
    }
    return name;
  }
}
