import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 50);
    path.quadraticBezierTo(width, 0, width - 50, 0);
    path.quadraticBezierTo(width * .5, 25, 50, 0);
    path.quadraticBezierTo(0, 0, 0, 50);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class GraphClipper extends CustomClipper<Path> {
  final double currentTemp;
  final double? nextTemp;
  final bool isFirst;
  final bool isLast;

  GraphClipper(
      {required this.currentTemp,
      required this.nextTemp,
      required this.isFirst,
      required this.isLast});
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, (height - (nextTemp??currentTemp) - 50));
    path.lineTo(0, (height - (currentTemp) - 50));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
