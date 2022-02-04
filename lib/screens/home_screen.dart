// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weather_flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:weather_flutter_app/const/theme.dart' as style;
import 'package:weather_flutter_app/const/utils.dart';
import 'package:weather_flutter_app/models/searched_city_model.dart';
import 'package:weather_flutter_app/screens/welcome_screen.dart';
import 'package:weather_flutter_app/widgets/home_screen_widgets/daily_time.dart';
import 'package:weather_flutter_app/widgets/home_screen_widgets/hourly_time.dart';
import 'package:weather_flutter_app/widgets/home_screen_widgets/more_details.dart';
import 'package:weather_flutter_app/widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserUnauthenticated) {
          Get.offAll(() => WelcomeScreen());
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is UserAuthenticated) {
            SearchedCityModel searchedCityModel = state.searchedCityModel;
            var currentDate = DateTime.fromMicrosecondsSinceEpoch(
                searchedCityModel.current!.dt * 1000000);
            String formattedTime = DateFormat.Hms().format(currentDate);

            return Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startTop,
                floatingActionButton: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        UserIsLoggedOut(),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: style.Colors.mainColor,
                            width: 1,
                          )),
                      child: Center(
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                body: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'images/welcome.png',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(
                          state.cityName,
                          style: TextStyle(
                            fontFamily: AppFont.poppinsBold,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    searchedCityModel
                                        .current!.weather![0].description
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: AppFont.poppinsBold,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // Spacer(),
                                  Text(
                                    searchedCityModel.current!.temp.toString() +
                                        "°C",
                                    style: TextStyle(
                                      fontFamily: AppFont.poppinsBold,
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Более детальная информация",
                                        style: TextStyle(
                                          fontFamily: AppFont.poppinsBold,
                                          fontSize: 20,
                                          color: Colors.black,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      MoreDetails(
                                        title: 'Время',
                                        data: formattedTime,
                                        icon: FontAwesomeIcons.clock,
                                      ),
                                      MoreDetails(
                                        title: 'Облако',
                                        data: searchedCityModel.current!.clouds
                                                .toString() +
                                            "%",
                                        icon: FontAwesomeIcons.cloud,
                                      ),
                                      MoreDetails(
                                        title: 'похоже на',
                                        data: searchedCityModel
                                                .current!.feelsLike
                                                .toString() +
                                            "°C",
                                        icon: FontAwesomeIcons.tshirt,
                                      ),
                                      MoreDetails(
                                        title: 'Влажность',
                                        data: searchedCityModel
                                                .current!.humidity
                                                .toString() +
                                            "%",
                                        icon: FontAwesomeIcons.sun,
                                      ),
                                      MoreDetails(
                                        title: 'Скорость ветра',
                                        data: searchedCityModel
                                                .current!.windSpeed
                                                .toString() +
                                            "м/с",
                                        icon: FontAwesomeIcons.wind,
                                      ),
                                      MoreDetails(
                                        title: 'Давление',
                                        data: searchedCityModel
                                                .current!.pressure
                                                .toString() +
                                            "hPa",
                                        icon: FontAwesomeIcons.snowflake,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Card(
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  constraints: BoxConstraints(
                                      minHeight: 20, minWidth: 80),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          searchedCityModel.hourly!.length,
                                      itemBuilder: (context, index) {
                                        var hourlyDate =
                                            DateTime.fromMicrosecondsSinceEpoch(
                                                searchedCityModel
                                                        .hourly![index].dt *
                                                    1000000);
                                        String formattedhourlyTime =
                                            DateFormat.Hms().format(hourlyDate);
                                        var hourlyData =
                                            searchedCityModel.hourly![index];
                                        return HourlyTime(
                                          feels:
                                              hourlyData.feelsLike.toString(),
                                          temp: hourlyData.temp.toString(),
                                          time: formattedhourlyTime,
                                        );
                                      }),
                                )),
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: searchedCityModel.daily!.length,
                                itemBuilder: (context, index) {
                                  var dailyDate =
                                      DateTime.fromMicrosecondsSinceEpoch(
                                          searchedCityModel.daily![index].dt *
                                              1000000);
                                  String formattedDailyTime =
                                      DateFormat("EEEE").format(dailyDate);
                                  var dailyData =
                                      searchedCityModel.daily![index];
                                  return DailyTime(
                                    day: formattedDailyTime.toString(),
                                    description: dailyData
                                        .weather![0].description
                                        .toString(),
                                    max: dailyData.temp!.max.toString(),
                                    min: dailyData.temp!.min.toString(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
