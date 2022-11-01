import 'package:flutter/material.dart';
import 'package:weather/component/weather_details.dart';
import 'package:weather/component/week_card.dart';
import 'package:weather/constants.dart';
import 'package:intl/intl.dart';

class WeatherWeekly extends StatefulWidget {
  const WeatherWeekly(
      {Key? key,
      required this.country,
      required this.cityName,
      this.weatherData})
      : super(key: key);

  final String cityName;
  final String country;
  final dynamic weatherData;
  @override
  State<WeatherWeekly> createState() => _WeatherWeeklyState();
}

class _WeatherWeeklyState extends State<WeatherWeekly> {
  int humidity = 0;
  int pressure = 0;
  double windSpeed = 0;
  int windDirection = 0;
  double rainVolume = 0;
  int cloudiness = 0;
  int sunRise = 0;
  int sunSet = 0;

  @override
  void initState() {
    super.initState();
    updateUi(widget.weatherData);
  }

  void updateUi(weatherData) {
    setState(() {
      if (weatherData == null) {
        pressure = 0;
        humidity = 0;
        windSpeed = 0;
        windDirection = 0;
        cloudiness = 0;
      } else {
        pressure = weatherData['main']['pressure'];
        humidity = weatherData['main']['humidity'];
        windSpeed = weatherData['wind']['speed'];
        windDirection = weatherData['wind']['deg'];
        cloudiness = weatherData['clouds']['all'];
        sunRise = weatherData['sys']['sunrise'];
        sunSet = weatherData['sys']['sunset'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String city = widget.cityName;
    String country = widget.country;

    String timeStamp(int timeStamp) {
      var dateToTimeStamp =
          DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
      return DateFormat('HH:mm').format(dateToTimeStamp);
    }

    String sunRiseTime = timeStamp(sunRise);
    String sunSetTime = timeStamp(sunSet);

    return Scaffold(
      backgroundColor: const Color(0xFF171829),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('$city, $country'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This Week',
                style: kPrimaryTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const WeekCard(
                day: 'Mon',
                image: 'few_clouds_day.png',
                condition: 'Cloudy',
                temperature: 20,
                feelsLike: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              const WeekCard(
                day: 'Tue',
                image: 'rain_day.png',
                condition: 'Rainy',
                temperature: 22,
                feelsLike: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              const WeekCard(
                day: 'Wed',
                image: 'rain_day.png',
                condition: 'Rainy',
                temperature: 20,
                feelsLike: 14,
              ),
              const SizedBox(
                height: 20,
              ),
              const WeekCard(
                day: 'Thu',
                image: 'storm_day.png',
                condition: 'Storm',
                temperature: 25,
                feelsLike: 28,
              ),
              const SizedBox(
                height: 20,
              ),
              const WeekCard(
                day: 'Fri',
                image: 'shower_rain.png',
                condition: 'Rainy',
                temperature: 18,
                feelsLike: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              const WeekCard(
                day: 'Sat',
                image: 'rain_day.png',
                condition: 'Rainy',
                temperature: 25,
                feelsLike: 17,
              ),
              const SizedBox(
                height: 20,
              ),
              const WeekCard(
                day: 'Sun',
                image: 'snow.png',
                condition: 'Snow',
                temperature: 9,
                feelsLike: 7,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'More details',
                style: kPrimaryTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              WeatherDetails(
                image: 'drop.png',
                name: 'Humidity',
                value: '$humidity%',
              ),
              const Divider(
                color: Colors.white70,
                height: 20,
                indent: 40,
              ),
              WeatherDetails(
                image: 'wind.png',
                name: 'Wind',
                value: '$windSpeed km/h ($windDirection°)',
              ),
              const Divider(
                color: Colors.white70,
                height: 20,
                indent: 40,
              ),
              WeatherDetails(
                image: 'sunrise.png',
                name: 'Sunrise',
                value: sunRiseTime,
              ),
              const Divider(
                color: Colors.white70,
                height: 20,
                indent: 40,
              ),
              WeatherDetails(
                image: 'sunset.png',
                name: 'Sunset',
                value: sunSetTime,
              ),
              const Divider(
                color: Colors.white70,
                height: 20,
                indent: 40,
              ),
              WeatherDetails(
                image: 'pressure.png',
                name: 'Pressure',
                value: '$pressure hPa',
              ),
              const Divider(
                color: Colors.white70,
                height: 20,
                indent: 40,
              ),
              const WeatherDetails(
                image: 'rain.png',
                name: 'Rain volume',
                value: '3.16mm',
              ),
              const Divider(
                color: Colors.white70,
                height: 20,
                indent: 40,
              ),
              WeatherDetails(
                image: 'cloud.png',
                name: 'Cloudiness',
                value: '$cloudiness%',
              ),
              const Divider(
                color: Colors.white70,
                height: 20,
                indent: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
