import 'package:flutter/material.dart';
import 'package:my_weather/controllers/funtions/fundamental_functions.dart';

import '../domain/clippers.dart';

class GraphContainer extends StatelessWidget {
  final double currentTemp;
  final double? nextTemp;
  final int index;
  const GraphContainer(
      {super.key,
      required this.currentTemp,
      this.nextTemp,
      required this.index});

  @override
  Widget build(BuildContext context) {
    int currentHour = GetData.time();
    return ClipPath(
      clipper: GraphClipper(
        currentTemp: currentTemp,
        nextTemp: nextTemp,
      ),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [currentHour==index?Colors.blue.shade900:Colors.blue,  Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
