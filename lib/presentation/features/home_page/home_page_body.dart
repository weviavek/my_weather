import 'package:flutter/material.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:my_weather/widgets/graph_maker.dart';
import 'package:my_weather/widgets/last_updated_time.dart';

class HomePageBody extends StatelessWidget {
  final HomePageLoadedState state;
  final HomePageBloc homePageBloc;
  const HomePageBody({super.key, required this.state,required this.homePageBloc});

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
                    child: GraphMaker(
                        currentList: state.todaysList.temperatureList)),
              )),
              LastUpdatedTime(
                lastTime: state.lastUpdatedTime,
                homePageBloc: homePageBloc,
              )
            ],
          )),
    );
  }
}
