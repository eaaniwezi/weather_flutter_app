// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../const/utils.dart';
import '../const/theme.dart' as Style;

class ErrorIndicatorWidget extends StatelessWidget {
  const ErrorIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: Container(
              width: 300.0,
              height: 500.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("images/error.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(
            "Ошибка при получении данных о погоде",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: AppFont.poppinsRegular,
                fontSize: 14,
                color: Colors.red),
          )
        ],
      )),
    );
  }
}
