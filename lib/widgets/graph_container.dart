import 'package:flutter/material.dart';

import '../domain/constants/clippers.dart';

class GraphContainer extends StatelessWidget {
  final double? preTemp;
  final double currentTemp;
  final double? nextTemp;
  final bool isFirst;
  final bool isLast;
  const GraphContainer(
      {super.key,
      this.preTemp,
      required this.currentTemp,
      this.nextTemp,
      required this.isFirst,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GraphClipper(
          preTemp: preTemp,
          currentTemp: currentTemp,
          nextTemp: nextTemp,
          isFirst: isFirst,
          isLast: isFirst),
      child: Container(
        height: 100,
        width: 75,
        decoration:const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
