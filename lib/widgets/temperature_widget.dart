import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  final int tempC;
  final int feelsLikeC;
  const TemperatureWidget({super.key, required this.tempC,required this.feelsLikeC});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$tempC\u00B0C',
          style: const TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          "Feels Like $feelsLikeC\u00B0C",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    ));
  }
}
