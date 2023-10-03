import 'package:flutter/material.dart';

import '../domain/constants/clippers.dart';

class GraphContainer extends StatelessWidget {
  final double currentTemp;
  final double? nextTemp;
  final bool isFirst;
  final bool isLast;
  const GraphContainer(
      {super.key,
      required this.currentTemp,
      this.nextTemp,
      required this.isFirst,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GraphClipper(
          currentTemp: currentTemp,
          nextTemp: nextTemp,
          isFirst: isFirst,
          isLast: isFirst),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
