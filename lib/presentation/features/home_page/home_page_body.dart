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
                height: 70,
                child: ListView.builder(
                    itemCount: state.todaysList.temperatureList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GraphContainer(
                          currentTemp: state.todaysList.temperatureList[index],
                          preTemp: index == 0
                              ? null
                              : state.todaysList.temperatureList[index - 1],
                          nextTemp: index ==
                                  state.todaysList.temperatureList.length - 1
                              ? null
                              : state.todaysList.temperatureList[index + 1],
                          isFirst: index == 0 ? true : false,
                          isLast: index ==
                                  state.todaysList.temperatureList.length - 1
                              ? true
                              : false,
                        )),
              ),
            ],
          )),
    );
  }
}
