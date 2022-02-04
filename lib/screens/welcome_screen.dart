// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_flutter_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_flutter_app/const/utils.dart';
import 'package:weather_flutter_app/const/theme.dart' as style;
import 'package:weather_flutter_app/screens/home_screen.dart';
import 'package:weather_flutter_app/widgets/loading_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is SearchedCityCordinates){
          Get.offAll(()=> HomeScreen());
        }
      },
      child: Scaffold(
          body: Form(
        key: _globalkey,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/welcome.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: style.Colors.mainColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "введите название своего города",
                          style: TextStyle(
                            fontFamily: AppFont.poppinsBold,
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      //!
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Не может быть пустым";
                            } else {
                              return null;
                            }
                          },
                          controller: cityController,
                          decoration: InputDecoration(
                            hintText: "Казань",
                            hintStyle: TextStyle(
                                fontFamily: AppFont.poppinsRegular,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          BlocBuilder<WeatherBloc, WeatherState>(
                              builder: (context, state) {
                            if (state is SearchCityFailure) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'не могу найти этот город',
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsRegular,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              );
                            } else if (state is SearchingCityCordinates) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'получение данных о погоде....',
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsRegular,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.green),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              );
                            }
                            return Text('');
                          }),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  FormState? formState =
                                      _globalkey.currentState;
                                  if (formState!.validate()) {
                                    BlocProvider.of<WeatherBloc>(context).add(
                                      SearchCityEvent(
                                        cityName: cityController.text,
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: style.Colors.secondaryColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_sharp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      )),
    );
  }
}
