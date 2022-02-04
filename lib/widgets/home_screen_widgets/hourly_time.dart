// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_flutter_app/const/theme.dart' as style;
import 'package:weather_flutter_app/const/utils.dart';

class HourlyTime extends StatelessWidget {
  final String time;
  final String temp;
  final String feels;
  const HourlyTime({
    Key? key,
    required this.time,
    required this.temp,
    required this.feels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),
        constraints: BoxConstraints(minHeight: 20, minWidth: 80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: style.Colors.mainColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
              ),
              Text(
                temp + "°C",
              ),
              Text(
                "похоже на",
                style: TextStyle(
                  fontFamily: AppFont.poppinsBold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              Text(
                feels + "°C",
                style: TextStyle(
                  fontFamily: AppFont.poppinsBold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
