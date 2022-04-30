import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '19552e007e1b6b2d369c5acd5e3d07b6';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWheather(String city) async {
    var networkHelper = NetworkHelper(
        url: '$openWeatherMapURL?q=$city&units=metric&appid=$apiKey');

    dynamic weatherData;
    try {
      weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    var networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${loc.latitude}&lon=${loc.longitude}&units=metric&appid=$apiKey');

    dynamic weatherData;
    try {
      weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e) {
      print(e);
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
