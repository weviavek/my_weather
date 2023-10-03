import 'package:flutter/material.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';

import '../../../domain/constants/clippers.dart';
import '../../../widgets/weather_animation_widget.dart';

class HomePageAppBar extends StatelessWidget {
  final HomePageLoadedState state;
  const HomePageAppBar({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.7,
      floating: false,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 1),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0, color: Colors.white, style: BorderStyle.none)),
            child: Image.asset(
              "assets/images/sunny_day.png",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.white, width: 0, style: BorderStyle.none),
                  ),
                  height: 50,
                  child: const Center(
                    child: Icon(
                      Icons.minimize_rounded,
                      color: Colors.grey,
                    ),
                  ),
                )),
          ),
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SafeArea(
                  child: Text(
                    state.currentLocationData.currentLocation,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * .6,
                      width: MediaQuery.sizeOf(context).width * .35,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${state.currentWeather.tempC}\u00B0C',
                            style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Feels Like ${state.currentWeather.feelsLikeC}\u00B0C",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      )),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .6,
                      height: 200,
                      child: const WeatherAnimationWidget(
                          duration: 10, imagePath: 'assets/cloud.png'),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
