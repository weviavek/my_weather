import 'package:flutter/material.dart';

import '../domain/clippers.dart';

class TopCurvedContainer extends StatelessWidget {
  const TopCurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CurveClipper(),
        child: Container(
          color: Colors.white,
          height: 50,
          child: const Center(
            child: Icon(
              Icons.minimize_rounded,
              color: Colors.grey,
            ),
          ),
        ));
  }
}
