import 'package:weather_icons/weather_icons.dart';
import 'netwrok.dart';
import 'location.dart';

const kapiKey = '1e5cc4660941dc5e76797606b493bb94';

const openweathermapurl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    Networking networking = Networking(
        '$openweathermapurl?lat=${location.latitude}&lon=${location.longitude}&appid=$kapiKey');
    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityname) async {
    Networking networking =
        Networking('$openweathermapurl?q=$cityname&appid=$kapiKey');
    var weatherData = await networking.getData();
    return weatherData;
  }

  dynamic getWeatherIcon(int condition) {
    print(condition);
    if (condition < 300) {
      return WeatherIcons.thunderstorm;
    } else if (condition < 400) {
      return WeatherIcons.raindrops;
    } else if (condition < 500) {
      return WeatherIcons.rain;
    } else if (condition < 600) {
      return WeatherIcons.rain;
    } else if (condition < 700) {
      return WeatherIcons.snow;
    } else if (condition < 800) {
      return WeatherIcons.smoke;
    } else if (condition == 800) {
      return WeatherIcons.day_sunny;
    } else if (condition <= 804) {
      return WeatherIcons.cloudy;
    } else {
      return WeatherIcons.day_sunny;
    }
  }

  dynamic selectimage(int condition) {
    if (condition < 300) {
      return 'images/thunderstorm.jpg';
    } else if (condition < 400) {
      return 'images/drizzle.jpg';
    } else if (condition < 500) {
      return 'images/rain.jpg';
    } else if (condition < 600) {
      return 'images/rain.jpg';
    } else if (condition < 700) {
      return 'images/smoke.jpg';
    } else if (condition < 800) {
      return 'images/haze.jpg';
    } else if (condition == 800) {
      return 'images/sunny.jpg';
    } else if (condition <= 804) {
      return 'images/earth.jpg';
    } else {
      return 'images/earth.jpg';
    }
  }
}
