// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:weather_flutter_app/const/theme.dart' as style;
import 'package:weather_flutter_app/const/utils.dart';

class DailyTime extends StatelessWidget {
  final String day;
  final String description;
  final String min;
  final String max;
  const DailyTime({
    Key? key,
    required this.day,
    required this.description,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListTile(
        leading: Text(
          day.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: AppFont.poppinsBold,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        title: Text(
          description.toString(),
          style: TextStyle(
            fontFamily: AppFont.poppinsBold,
            fontSize: 15,
            color: style.Colors.secondaryColor,
          ),
        ),
        subtitle: Text(
          min.toString() + "°C | " + max.toString() + "°C",
          style: TextStyle(
            fontFamily: AppFont.poppinsBold,
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
