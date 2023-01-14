import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '';
const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  double longitude;
  double latitude;

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherUrl?q=$cityName&cnt=7&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async  {
    Location location = new Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;
    // https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&cnt=7&appid=
    NetworkHelper networkHelper = new NetworkHelper('$openWeatherUrl?lat=$latitude&lon=$longitude&cnt=7&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
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
