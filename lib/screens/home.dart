import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:weather/bottom_row.dart';
import 'package:weather/condition/name_correct.dart';
import 'package:weather/constant/style.dart';
import 'package:weather/screens/loading.dart';
import 'package:weather/screens/location_bycity.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String cityName;
  Check check = Check();
  String errorMessage = '';
  TextEditingController _cityName = TextEditingController();
  checkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Loading();
      }));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Image.asset(
            'images/bg2.jpg',
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.black54,
          body: Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: 28),
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'lato',
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hello',
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Check the weather by City',
                        style: kTextStyle,
                      ),
                      SizedBox(height: 30),
                      Text(
                        errorMessage,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        controller: _cityName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: kInputTextDecoration,
                      ),
                      Center(
                        child: FlatButton.icon(
                          textColor: Colors.white,
                          focusColor: Colors.black12,
                          label: Text(
                            'Search',
                            style: TextStyle(fontSize: 20),
                          ),
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            cityName = _cityName.text;
                            String cityCheck = await check.checkName(cityName);
                            if (cityName != null) {
                              if (cityCheck == 'true') {
                                errorMessage = '';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LocationByCity(
                                        locationbyCity: cityName,
                                      );
                                    },
                                  ),
                                );
                                _cityName.clear();
                              } else {
                                setState(() {
                                  errorMessage = 'Enter valid city name';
                                });
                              }
                            } else {}
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'My Location',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            splashColor: Colors.grey,
                            onPressed: () {
                              checkStatus();
                            },
                            icon: Icon(
                              Icons.my_location,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      BottomRow(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
