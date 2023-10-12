import 'package:flutter/material.dart';
import 'package:my_weather/domain/constants/assets.dart';
import 'package:my_weather/domain/constants/image_constants.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:my_weather/widgets/temperature_widget.dart';
import 'package:my_weather/widgets/top_curved_container.dart';

import '../../../widgets/weather_animation_widget.dart';

class HomePageAppBar extends StatelessWidget {
  final HomePageLoadedState state;
  const HomePageAppBar({super.key, required this.state});

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
            child: Image.asset(
              Assets.getDefaultBackgroud(),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 1),
            child: Image.network(
              BackgroudImageHelper.getImage(state.currentWeather.condition),
              fit: BoxFit.cover,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: TopCurvedContainer()
          ),
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(
                  state.currentLocationData.currentLocation,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    SizedBox(
                        height: MediaQuery.sizeOf(context).width * .6,
                        width: MediaQuery.sizeOf(context).width * .35,
                        child: TemperatureWidget(
                            tempC: state.currentWeather.tempC,
                            feelsLikeC: state.currentWeather.feelsLikeC)),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .6,
                      height: 200,
                      child: WeatherAnimationWidget(
                          duration: 10,
                          imagePath: AnimationImageHelper.getImage(
                              state.currentWeather.condition)),
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
