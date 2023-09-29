import 'package:flutter/material.dart';

class WeatherAnimationWidget extends StatefulWidget {
  final int duration;
  final String imagePath;
  const WeatherAnimationWidget(
      {super.key, required this.duration, required this.imagePath});

  @override
  WeatherAnimationWidgetState createState() => WeatherAnimationWidgetState();
}

class WeatherAnimationWidgetState extends State<WeatherAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  ValueNotifier<bool> visible = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );

    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.value > .2) {
        visible.value = true;
      }
      if (_animationController.value > .8) {
        visible.value = false;
      }
    });
    Animation<Offset> temo = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(2.5, 0.0),
    ).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });
    return SlideTransition(
        position: temo,
        child: ValueListenableBuilder(
          valueListenable: visible,
          builder: (context, bool value, __) => AnimatedOpacity(
            opacity: value ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Image.asset(
              widget.imagePath,
              width: 150,
            ),
          ),
        ));
  }
}
