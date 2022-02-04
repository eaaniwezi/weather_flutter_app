import 'package:flutter/material.dart';

import 'package:weather_flutter_app/const/theme.dart' as style;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_flutter_app/const/utils.dart';

class MoreDetails extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;
  const MoreDetails({
    Key? key,
    required this.icon,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: style.Colors.secondaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: AppFont.poppinsBold,
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        data,
        style: TextStyle(
          fontFamily: AppFont.poppinsBold,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
