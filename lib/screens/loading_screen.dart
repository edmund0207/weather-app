import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';
import '../constants.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isDone = false;
  dynamic weatherData;
  String text = '';

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  void getCurrentPosition() async {
    WeatherModel weather = WeatherModel();
    weatherData = await weather.getWeatherData();
    setState(() {
      isDone = true;
    });
    print(isDone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/weather_image.png',
              scale: 0.1,
            ),
            const SizedBox(height: 30),
            // const Text(
            //   'Discover the Weather in your City',
            //   style: kPrimaryTextStyle,
            //   textAlign: TextAlign.center,
            // ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Discover the ', style: kPrimaryTextStyle),
                  TextSpan(text: 'Weather ', style: kWeatherTextStyle),
                  TextSpan(text: 'in your City', style: kPrimaryTextStyle),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Get to know your weather maps and radar precipitation forecast',
              style: kSecondaryTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                if (isDone == true) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen(
                      weatherData: weatherData,
                    );
                  }));
                }
                getCurrentPosition();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF0095FF),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Text(
                  isDone ? 'Get started' : 'Please wait...',
                  textAlign: TextAlign.center,
                  style: kButtonTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
