import 'package:flutter/material.dart';

import '../constants.dart';

class WeekCard extends StatelessWidget {
  const WeekCard({
    Key? key,
    required this.day,
    required this.image,
    required this.temperature,
    required this.feelsLike,
    required this.condition,
  }) : super(key: key);

  final String day;
  final String image;
  final String condition;
  final int temperature;
  final int feelsLike;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                day,
                style: kPropertyTextStyle,
              ),
              Image.asset(
                'icons/$image',
                width: 25,
                height: 25,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                condition,
                style: kPropertyTextStyle,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: '$temperature°', style: kNavBarTextStyle),
                  TextSpan(text: ' +$feelsLike°', style: kSubPropertyTextStyle)
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
