import 'package:flutter/material.dart';
import 'package:weather/condition/bg_image.dart';
import 'package:weather/condition/icon.dart';

class WeatherApp extends StatefulWidget {
  static const String id = 'weatherApp';
  final allInformation;
  final timeInformation;
  WeatherApp({this.allInformation, this.timeInformation});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  IconAccordingToWeather iconAccordingToWeather = IconAccordingToWeather();
  BackGroundImage backGroundImage = BackGroundImage();
  String cityName;
  int temperature;
  var windSpeed;
  double rain;
  int humidity;
  String skyType;
  Icon weatherIcon;
  String imageName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upDateUi(widget.allInformation);
  }

  void upDateUi(dynamic weatherData) {
    setState(() {
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      cityName = weatherData['name'];
      skyType = weatherData['weather'][0]['main'];
      imageName = backGroundImage.getImage(skyType);
      var wSpeed = weatherData['wind']['speed'];
      windSpeed = wSpeed * 3.6.round();
      humidity = weatherData['main']['humidity'];
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = iconAccordingToWeather.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/$imageName',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.black38,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'lato',
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cityName,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.timeInformation != null
                              ? widget.timeInformation
                              : '',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '$temperature\u2103',
                        style: TextStyle(
                            fontSize: 85, fontWeight: FontWeight.w300),
                      ),
                      Row(
                        children: <Widget>[
                          weatherIcon,
                          SizedBox(width: 20),
                          Text(
                            skyType,
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ReusableColumn(
                            dataName: 'wind',
                            dataValue: windSpeed.toString(),
                            dataUnit: 'Km/h',
                          ),
//                          ReusableColumn(
//                            dataName: 'Rain',
//                            dataValue: '5',
//                            dataUnit: '%',
//                          ),
                          ReusableColumn(
                            dataName: 'Humidity',
                            dataValue: humidity.toString(),
                            dataUnit: '%',
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ReusableColumn extends StatelessWidget {
  final String dataName;
  final String dataValue;
  final String dataUnit;
  ReusableColumn({this.dataName, this.dataUnit, this.dataValue});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          dataName,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
        Text(
          dataValue,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
        Text(
          dataUnit,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
      ],
    );
  }
}
