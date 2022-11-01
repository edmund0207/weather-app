import 'package:flutter/material.dart';
import 'package:weather/constants.dart';
import 'package:weather/navigation_bar.dart';
import 'package:weather/screens/search_screen.dart';
import 'package:weather/services/weather.dart';

import '../component/weather_weekly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.weatherData}) : super(key: key);

  final dynamic weatherData;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weather = WeatherModel();
  dynamic weatherInfo;
  int temperature = 0;
  String cityName = '';
  String country = '';
  String description = '';
  String weatherIcon = '';
  int pressure = 0;
  int feelsLike = 0;
  int humidity = 0;

  @override
  void initState() {
    super.initState();
    weatherInfo = updateUi(widget.weatherData);
  }

  dynamic updateUi(weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = '';
        country = '';
        description = 'Unable to load data';
        weatherIcon = 'Error';
        pressure = 0;
        feelsLike = 0;
        humidity = 0;
      } else {
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        cityName = weatherData['name'];
        country = weatherData['sys']['country'];
        description = weatherData['weather'][0]['description'];
        String icon = weatherData['weather'][0]['icon'];
        weatherIcon = weather.getWeatherIcons(icon);
        pressure = weatherData['main']['pressure'];
        double tempFeelsLike = weatherData['main']['feels_like'];
        feelsLike = tempFeelsLike.toInt();
        humidity = weatherData['main']['humidity'];
        // update the weather icon
      }
    });
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const SizedBox(width: 50),
            const Icon(
              Icons.location_on_outlined,
              size: 20,
              color: Color(0xFF0095FF),
            ),
            Text(
              ' $cityName, $country',
              style: kButtonTextStyle,
            )
          ],
        ),
        centerTitle: true,
      ),
      drawer: const NavBar(),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 30),
              child: Text(
                'Today\'s Report',
                textAlign: TextAlign.left,
                style: kPrimaryTextStyle,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'icons/$weatherIcon',
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    description,
                    style: kDescriptionTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '$temperature', style: kTemperatureTextStyle),
                        const TextSpan(text: '°', style: kDegreeTextStyle)
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'Feels like ', style: kPropertyTextStyle),
                        TextSpan(
                            text: '$feelsLike°', style: kPropertyBlueTextStyle)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'icons/pressure.png',
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '$pressure hPa',
                              style: kPropertyTextStyle,
                            ),
                            const Text(
                              'Pressure',
                              style: kSubPropertyTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'icons/drop.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '$humidity%',
                              style: kPropertyTextStyle,
                            ),
                            const Text(
                              'Humidity',
                              style: kSubPropertyTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // Icon(Icons.cloudy_snowing,
                            //     color: Color(0xFFFED058), size: 25),
                            Image.asset(
                              'icons/shower_rain.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '35mm',
                              style: kPropertyTextStyle,
                            ),
                            const Text(
                              'Chance of rain',
                              style: kSubPropertyTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF171829),
                    ),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.home_filled,
                          size: 28,
                          color: Color(0xFF0095FF),
                        ),
                        GestureDetector(
                          onTap: () async {
                            var typedCity = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SearchLocation();
                            }));
                            if (typedCity != null) {
                              var cityWeather = await WeatherModel()
                                  .getCityWeather(typedCity);
                              weatherInfo = updateUi(cityWeather);
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            size: 28,
                            color: Color(0xFF878891),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            var weatherData =
                                await WeatherModel().getWeatherData();
                            weatherInfo = updateUi(weatherData);
                          },
                          child: const Icon(
                            Icons.my_location,
                            size: 28,
                            color: Color(0xFF878891),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WeatherWeekly(
                                  cityName: cityName,
                                  country: country,
                                  weatherData: weatherInfo);
                            }));
                          },
                          child: const Icon(
                            Icons.description,
                            size: 28,
                            color: Color(0xFF878891),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
