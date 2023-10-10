import 'package:flutter/material.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';

import '../../../widgets/graph_container.dart';

class HomePageBody extends StatelessWidget {
  final HomePageLoadedState state;
  const HomePageBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white, width: 0, style: BorderStyle.none)),
          height: MediaQuery.sizeOf(context).height * .6,
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.blue.shade50),
                      height: 170,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowIndicator();
                          return false;
                        },
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.todaysList.temperatureList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              double currentTemp =
                                  state.todaysList.temperatureList[index];
                              double? nextTemp = index ==
                                      state.todaysList.temperatureList.length -
                                          1
                                  ? null
                                  : state.todaysList.temperatureList[index + 1];

                              String sufix = index < 12 ? 'AM' : 'PM';
                              String current = index % 12 != 0
                                  ? (index % 12).toString()
                                  : '12';

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      GraphContainer(
                                        index: index,
                                          currentTemp: currentTemp,
                                          nextTemp: nextTemp),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 90 -
                                                (currentTemp +
                                                    (nextTemp ?? currentTemp) /
                                                        2)),
                                        child: Text(
                                          '$currentTemp \u00B0C',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("$current : 00 $sufix"),
                                ],
                              );
                            }),
                      ),
                    )),
              )
            ],
          )),
    );
  }
}
