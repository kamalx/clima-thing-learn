import 'package:Clima/services/location.dart';
import 'package:Clima/services/networking.dart';

const apiKey = 'api_key_goes_here';
const openWeathermapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = openWeathermapUrl;
    url += '?q=$cityName&appid=$apiKey&units=metric';

    NetworkHelper nh = NetworkHelper(url);

    var weatherData = await nh.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    // using geolocator
    Location location = Location();
    await location.getCurrentLocation();

    String url = openWeathermapUrl +
        '?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey' +
        '&units=metric';

    // using http et al
    NetworkHelper nh = NetworkHelper(url);

    var weatherData = await nh.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    // here's the lookup table for conditions
    // if you ever need it
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
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 23) {
      return 'Time for shorts and 👕';
    } else if (temp < 15) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
