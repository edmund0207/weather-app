import 'package:flutter/material.dart';
import 'package:weather/constants.dart';
import '../component/city_card.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171829),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Search Preferred Locations',
          style: kButtonTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  onChanged: (value) {
                    cityName = value;
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, cityName);
                      },
                      child: const Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.arrow_forward,
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, style: BorderStyle.none),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter city name',
                    hintStyle: const TextStyle(
                      color: Color(0xFF878891),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  CityCard(
                    cityName: 'New York',
                    country: 'USA',
                    rainPercentage: 17,
                    windSpeed: 25,
                    temperature: 22,
                    image: 'shower_rain.png',
                  ),
                  SizedBox(width: 10),
                  CityCard(
                    cityName: 'Hong Kong',
                    country: 'China',
                    rainPercentage: 56,
                    windSpeed: 12,
                    temperature: 18,
                    image: 'clear_sky_day.png',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  CityCard(
                    cityName: 'London',
                    country: 'UK',
                    rainPercentage: 5,
                    windSpeed: 17,
                    temperature: 9,
                    image: 'snow.png',
                  ),
                  SizedBox(width: 10),
                  CityCard(
                    cityName: 'Kumasi',
                    country: 'Ghana',
                    rainPercentage: 45,
                    windSpeed: 25,
                    temperature: 13,
                    image: 'few_clouds_day.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
