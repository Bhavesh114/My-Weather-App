import 'package:flutter/material.dart';
import 'Location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = new WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationweather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
