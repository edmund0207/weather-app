import 'dart:convert';
import 'package:http/http.dart' as http;
import 'location.dart';

const apiKey = '309fc74a2877a778033dec5f4c5de014';

class WeatherModel {
  Future getCityWeather(String cityName) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'));
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('status code is ${response.statusCode}');
      }
    } catch (e) {
      print(response.statusCode);
    }
  }

  Future getWeatherData() async {
    CurrentLocation location = CurrentLocation();
    await location.getLocation();
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'));

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('status code is ${response.statusCode}');
      }
    } catch (e) {
      print(response.statusCode);
    }
  }

  String getWeatherIcons(String weatherIcon) {
    String image = '';
    if (weatherIcon == '01d') {
      image = 'clear_sky_day.png';
    } else if (weatherIcon == '01n') {
      image = 'clear_sky_night.png';
    } else if (weatherIcon == '02d') {
      image = 'few_clouds_day.png';
    } else if (weatherIcon == '02n') {
      image = 'few_clouds_night.png';
    } else if (weatherIcon == '03d') {
      image = 'scattered_clouds.png';
    } else if (weatherIcon == '03n') {
      image = 'scattered_clouds.png';
    } else if (weatherIcon == '04d') {
      image = 'broken_clouds.png';
    } else if (weatherIcon == '04n') {
      image = 'broken_clouds.png';
    } else if (weatherIcon == '09d') {
      image = 'shower_rain.png';
    } else if (weatherIcon == '09n') {
      image = 'shower_rain.png';
    } else if (weatherIcon == '10d') {
      image = 'rain_day.png';
    } else if (weatherIcon == '10n') {
      image = 'rain_night.png';
    } else if (weatherIcon == '11d') {
      image = 'storm_day.jpg';
    } else if (weatherIcon == '11n') {
      image = 'storm_night.jpg';
    } else if (weatherIcon == '13d') {
      image = 'snow.png';
    } else if (weatherIcon == '13n') {
      image = 'snow.png';
    } else if (weatherIcon == '50d') {
      image = 'mist.png';
    } else if (weatherIcon == '50n') {
      image = 'mist.png';
    }
    return image;
  }
}
