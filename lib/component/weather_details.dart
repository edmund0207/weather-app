import 'package:flutter/material.dart';

import '../constants.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.value,
  }) : super(key: key);

  final String image;
  final String name;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'icons/$image',
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: kPropertyTextStyle,
            ),
          ],
        ),
        Text(
          value,
          style: kNavBarTextStyle,
        ),
      ],
    );
  }
}
