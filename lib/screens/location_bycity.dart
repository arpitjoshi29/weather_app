import 'package:flutter/material.dart';
import 'package:weather/byinternet/network.dart';
import 'package:weather/screens/weather_app.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apikey = '1445ae74f46464b37b0fb5f8ec44bf34';
const String openWeatherUrl =
    'http://api.openweathermap.org/data/2.5/weather?q';

class LocationByCity extends StatefulWidget {
  final locationbyCity;
  LocationByCity({this.locationbyCity});
  @override
  _LocationByCityState createState() => _LocationByCityState();
}

class _LocationByCityState extends State<LocationByCity> {
  @override
  void initState() {
    super.initState();
    getLocationByCity();
  }

  Future getLocationByCity() async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherUrl=${widget.locationbyCity}&appid=$apikey&units=metric');
      var weatherData = await networkHelper.getData();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WeatherApp(allInformation: weatherData);
      }));
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[900],
      child: SpinKitRipple(
        color: Colors.white,
        size: 250.0,
      ),
    );
  }
}
