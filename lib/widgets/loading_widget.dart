// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../const/theme.dart' as style;

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SpinKitSquareCircle(
        size: 35,
        color: style.Colors.mainColor,
      ),
    );
  }
}