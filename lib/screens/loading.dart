import 'package:flutter/material.dart';
import 'package:weather/byinternet/location.dart';
import 'package:weather/byinternet/network.dart';
import 'package:weather/screens/weather_app.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/condition/time.dart';

const String apikey = '1445ae74f46464b37b0fb5f8ec44bf34';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();
    GetTime getTime = GetTime();
    String time = getTime.getCurrentTime();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WeatherApp(allInformation: weatherData, timeInformation: time);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: SpinKitRipple(
        color: Colors.white,
        size: 250.0,
      ),
    );
  }
}
