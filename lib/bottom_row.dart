import 'package:flutter/material.dart';
import 'package:weather/city_list.dart';
import 'package:weather/city_listclasss.dart';
import 'package:weather/condition/bg_image.dart';
import 'package:weather/screens/location_bycity.dart';
import 'package:weather/search.dart';

class BottomRow extends StatefulWidget {
  final dynamic data;
  BottomRow({this.data});
  @override
  _BottomRowState createState() => _BottomRowState();
}

class _BottomRowState extends State<BottomRow> {
  BottomCitySearch1 bottomCitySearch1 = BottomCitySearch1(cityName: 'London');
  BottomCitySearch1 bottomCitySearch2 = BottomCitySearch1(cityName: 'Mumbai');
  BackGroundImage backGroundImage = BackGroundImage();
  CityUpdate cityUpdate = CityUpdate();
  String cityName1;
  int temperature1;
  String skyType1;
  var weatherData1;
  String imageName1;

  String cityName2;
  int temperature2;
  String skyType2;
  var weatherData2;
  String imageName2;

  String newCityName;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    weatherData1 = await bottomCitySearch1.getLocationByCity();
    weatherData2 = await bottomCitySearch2.getLocationByCity();
    upDateUi1();
    upDateUi2();
  }

  void upDateUi1() {
    setState(() {
      var temp = weatherData1['main']['temp'];
      temperature1 = temp.toInt();
      cityName1 = weatherData1['name'];
      skyType1 = weatherData1['weather'][0]['main'];
      imageName1 = backGroundImage.getImage(skyType1);
    });
  }

  void upDateUi2() {
    setState(() {
      var temp = weatherData2['main']['temp'];
      temperature2 = temp.toInt();
      cityName2 = weatherData2['name'];
      skyType2 = weatherData2['weather'][0]['main'];
      imageName2 = backGroundImage.getImage(skyType2);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<City> cityList = [
      City(
          text: cityName1 == null ? '' : cityName1,
          temperature: temperature1 == null ? '' : '$temperature1 \u2103',
          weather: skyType1 == null ? '' : skyType1,
          imageName: imageName1 == null ? 'smoke.jpg' : imageName1),
      City(
          text: cityName2 == null ? '' : cityName2,
          temperature: temperature2 == null ? '' : '$temperature2 \u2103',
          weather: skyType2 == null ? '' : skyType2,
          imageName: imageName2 == null ? 'smoke.jpg' : imageName2)
    ];

    final height = MediaQuery.of(context).size.height;
    return DefaultTextStyle(
      style: TextStyle(fontFamily: 'lato'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var city in cityList)
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: GestureDetector(
                onTap: () {
                  if (city.text.isNotEmpty) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LocationByCity(
                        locationbyCity: city.text,
                      );
                    }));
                  } else {}
                },
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Image.asset(
                      'images/${city.imageName}',
                      height: height * .35,
                      width: height * .20,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black45,
                      height: height * .35,
                      width: height * .20,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          city.text,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 40),
                        Text(
                          city.temperature.toString(),
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          city.weather,
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(height: 15),
                        city.text.isNotEmpty
                            ? Text(
                                'Click for \n more info.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 8),
                              )
                            : Text(''),
                      ],
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
