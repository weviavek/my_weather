import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';

class LastUpdatedTime extends StatelessWidget {
  final DateTime lastTime;
  final HomePageBloc homePageBloc;
  const LastUpdatedTime(
      {super.key, required this.lastTime, required this.homePageBloc});

  @override
  Widget build(BuildContext context) {
    Stream<int> lastUpdated =
        Stream.periodic(const Duration(minutes: 1), (i) => i);
    String lastTime =
        "${this.lastTime.hour.toString()}:${this.lastTime.minute < 10 ? '0${this.lastTime.minute}' : '${this.lastTime.minute}'}";
    return SizedBox(
      child: Row(
        children: [
          StreamBuilder<int>(
              stream: lastUpdated,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int data = snapshot.data!;
                  if (data < 1) {
                    return const Text('Updated just now');
                  } else if (data > 59) {
                    return Text('Last updated at $lastTime');
                  } else {
                    return Text('Last updated ${snapshot.data} minutes ago');
                  }
                }
                return const Text('Updated just now');
              }),
          IconButton(
              onPressed: () {
                homePageBloc.add(InitHomeEvent());
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
    );
  }
}
