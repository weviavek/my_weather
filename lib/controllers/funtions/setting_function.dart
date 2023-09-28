import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';

class LocationSetting with WidgetsBindingObserver {
  final HomePageBloc homePageBloc;
  bool isInitCalled = false;
  StreamController<bool> controller = StreamController<bool>();

  LocationSetting({required this.homePageBloc});

  Stream<bool> get onInitCalled => controller.stream;

   void goToSettings() async {
    WidgetsBinding.instance.addObserver(this);
    await Geolocator.openAppSettings();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkPermissionAndInit();
    }
  }

  Future<void> checkPermissionAndInit() async {
    final permission = await Permission.location.status;
    if (permission == PermissionStatus.granted) {
      WidgetsBinding.instance.removeObserver(this);
      isInitCalled = true;
      homePageBloc.add(InitHomeEvent());
      controller.add(isInitCalled);
    }
  }

  void dispose() {
    controller.close();
  }
}
