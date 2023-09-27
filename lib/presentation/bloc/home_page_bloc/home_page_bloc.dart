import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:my_weather/controllers/dialogs/mannual_permission.dart';
import 'package:my_weather/model/current_model.dart';
import 'package:my_weather/model/model_list_today_hourly_forecast.dart';
import 'package:permission_handler/permission_handler.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitialState()) {
    on<InitHomeEvent>(_initailEvent);
    on<HomePermissionDeniedEvent>(_permissionDeniaedEvent);
  }

  FutureOr<void> _initailEvent(
      InitHomeEvent event, Emitter<HomePageState> emit) async {
    Future<Position> determinePosition() async {
      await Permission.location.isGranted.then((value) {
        print(value);
      });
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
      if (await Geolocator.checkPermission() ==
          LocationPermission.deniedForever) {
        add(HomePermissionDeniedEvent());
        return Future.error('');
      }
      if (await Geolocator.checkPermission() == LocationPermission.denied) {
        await Geolocator.requestPermission().then((value) {
          print(value);
        });
        if (await Geolocator.checkPermission() == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      return await Geolocator.getCurrentPosition();
    }

    final temp = await determinePosition();

    final resp = await get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=7b3b3e1274fb4d4395c52221232209&q=${temp.latitude},${temp.longitude}&days=5'));
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);

      emit(HomePageLoadedState(
          loaction: 'loaction',
          currentWeather: CurrentWeather.fromJson(data['current']),
          todaysList: HourlyList.addFromJson(data)));
    } else {
      emit(HomePageErroeState());
    }
  }

  FutureOr<void> _permissionDeniaedEvent(
      HomePermissionDeniedEvent event, Emitter<HomePageState> emit) {
    emit(HomePermissionDeniedState());
  }
}
