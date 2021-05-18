import 'package:weather/byinternet/network.dart';

const String apikey = '1445ae74f46464b37b0fb5f8ec44bf34';
const String openWeatherUrl =
    'http://api.openweathermap.org/data/2.5/weather?q';

class BottomCitySearch1 {
  String cityName;
  BottomCitySearch1({this.cityName});
  dynamic getLocationByCity() async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherUrl=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}

class BottomCitySearch2 {
  String cityName;
  BottomCitySearch2({this.cityName});
  dynamic getLocationByCity() async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherUrl=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
