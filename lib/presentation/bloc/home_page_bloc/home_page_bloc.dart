import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:my_weather/model/current_model.dart';
import 'package:my_weather/model/model_list_today_hourly_forecast.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitialState()) {
    on<InitHomeEvent>(_initailEvent);
  }

  FutureOr<void> _initailEvent(
      InitHomeEvent event, Emitter<HomePageState> emit) async {
    Future<Position?> determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      print(permission);
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return await determinePosition();
        } else if (permission == LocationPermission.deniedForever) {
          emit(HomePermissionDeniedState());
        }
      }
      try {
        return await Geolocator.getCurrentPosition();
      } catch (e) {
        return null;
      }
    }

    final temp = await determinePosition();
    print(temp);
    if (temp != null) {
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
    } else {
      emit(HomePageErroeState());
    }
  }
}
