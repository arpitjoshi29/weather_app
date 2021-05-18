class CityUpdate {
  String cityFormWeatherApp;
  String cityName;
  CityUpdate({this.cityFormWeatherApp});
  String check() {
    if (cityFormWeatherApp != null) {
      cityName = cityFormWeatherApp;
    } else {
      cityName = null;
    }
    return cityName;
  }
}
