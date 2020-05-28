import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';
import 'weather.dart';
import 'SearchScreen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temp;
  String cityname, description;
  int condition;
  IconData icon;
  String picname;

  WeatherModel weather = new WeatherModel();

  @override
  void initState() {
    super.initState();
    _updateinfo(widget.locationweather);
  }

  void _updateinfo(dynamic weatherData) {
    setState(
      () {
        cityname = weatherData['name'];
        temp = (weatherData['main']['temp'] - 273.15);
        description = weatherData['weather'][0]['description'];
        var condition = weatherData['weather'][0]['id'];
        icon = weather.getWeatherIcon(condition);
        picname = weather.selectimage(condition);
      },
    );
  }

  var now = new DateTime.now();
  final String date =
      new DateFormat.yMMMd().format(new DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(picname),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        padding: EdgeInsets.all(10.0),
                        icon: Icon(Icons.near_me),
                        color: Color(0xFFA3A5A8),
                        onPressed: () async {
                          var weatherData = await weather.getLocationWeather();
                          _updateinfo(weatherData);
                          print('hi');
                        },
                      ),
                      IconButton(
                        padding: EdgeInsets.all(10.0),
                        color: Color(0xFFA3A5A8),
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(),
                            ),
                          );

                          if (typedName != null) {
                            var weatherData =
                                await weather.getCityWeather(typedName);
                            _updateinfo(weatherData);
                          }
                        },
                        iconSize: 30.0,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      date,
                      style: kmaintext,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      cityname,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Montserrat-Medium'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
                    child: Text(
                      temp.round().toString() + '°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 6.5),
                          child: Text(
                            description[0].toUpperCase() +
                                description.substring(1),
                            style: kmaintext.copyWith(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          icon,
                          size: 30.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
