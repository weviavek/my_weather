import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';

class LocationSetting with WidgetsBindingObserver {
  HomePageBloc homePageBloc;

  LocationSetting({required this.homePageBloc});

  void goToSettings() async {
    WidgetsBinding.instance.addObserver(this);
    await Geolocator.openAppSettings();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    final permission = await Geolocator.checkPermission();

    print(state);
    if (state == AppLifecycleState.resumed &&
        !(permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse)) {
      homePageBloc.add(InitHomeEvent());
    }
  }
}
