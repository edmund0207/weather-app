import 'package:flutter/material.dart';

import '../constants.dart';
import '../services/weather.dart';

class CityCard extends StatefulWidget {
  const CityCard({
    Key? key,
    required this.temperature,
    required this.cityName,
    required this.country,
    required this.windSpeed,
    required this.rainPercentage,
    required this.image,
  }) : super(key: key);

  final int temperature;
  final String cityName;
  final String country;
  final int windSpeed;
  final int rainPercentage;
  final String image;

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.temperature}°',
                  style: kTempTextStyle,
                ),
                Image.asset(
                  'icons/${widget.image}',
                  height: 50,
                  width: 50,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.cityName,
              style: kPropertyTextStyle,
            ),
            Text(
              widget.country,
              style: kSubPropertyTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.water_drop, color: Color(0xFF0095FF)),
                    Text(
                      '${widget.rainPercentage}%',
                      style: kSubPropertyTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.wind_power_outlined,
                        color: Color(0xFF0095FF)),
                    Text(
                      '${widget.windSpeed} km/h',
                      style: kSubPropertyTextStyle,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
