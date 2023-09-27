import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather/controllers/funtions/setting_function.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';

class LocationSettingDialog {
  final HomePageBloc homePageBloc;
  LocationSettingDialog({required this.homePageBloc});
  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Stack(children: [
          LottieBuilder.asset('assets/lotties/error.json'),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .3,
            child: const Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Text(
                    'Oops!',
                    style: TextStyle(fontSize: 60),
                  ),
                  Text("Allow loaction permission manually",
                      style: TextStyle(fontSize: 25)),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          )
        ]),
        actions: [
          TextButton(onPressed: () => exit(0), child: const Text('Exit App')),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                LocationSetting(homePageBloc: homePageBloc).goToSettings();
                Navigator.pop(context);
              },
              child: const Text("Open App Settings"))
        ],
      ),
    );
  }
}
