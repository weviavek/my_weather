import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/controllers/dialogs/mannual_permission.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:my_weather/controllers/dialogs/error_dialog.dart';
import 'package:my_weather/widgets/weather_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageBloc homePageBloc = HomePageBloc();
  bool isShowing = false;
  @override
  void initState() {
    homePageBloc.add(InitHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      listener: (contexts, state) {
        if (state is HomePageLoadedState) {}
        ;
        if (state is HomePageErroeState) ErrorDialog.show(context);
        if (state is HomePermissionDeniedState) {
          isShowing = true;
          LocationSettingDialog(homePageBloc: homePageBloc).show(context);
        }
      },
      builder: (context, state) {
        return state is HomePageLoadedState
            ? Scaffold(
                extendBodyBehindAppBar: true,
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height * 0.7,
                      floating: false,
                      flexibleSpace: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 1),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0,
                                    color: Colors.white,
                                    style: BorderStyle.none)),
                            child: Image.asset(
                              "assets/images/sunny_day.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipPath(
                                clipper: _CurveClipper(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 0,
                                        style: BorderStyle.none),
                                  ),
                                  height: 50,
                                  child: const Center(
                                    child: Icon(
                                      Icons.minimize_rounded,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )),
                          ),
                          Positioned(
                            top: 40,
                            right: 0,
                            left: 0,
                            child: Column(
                              children: [
                                SafeArea(
                                  child: Text(
                                    state.currentLocationData.currentLocation,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).width * .6,
                                      width: MediaQuery.sizeOf(context).width *
                                          .35,
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${state.currentWeather.tempC}\u00B0C',
                                            style: const TextStyle(
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Feels Like ${state.currentWeather.feelsLikeC}\u00B0C",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      )),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width * .6,
                                      height: 200,
                                      child: const WeatherAnimationWidget(
                                          duration: 10,
                                          imagePath: 'assets/cloud.png'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white,
                                  width: 0,
                                  style: BorderStyle.none)),
                          height: MediaQuery.sizeOf(context).height * .6,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70, 
                                child: ListView.builder(
                                  itemCount:
                                      state.todaysList.temperatureList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Card(
                                    child: SizedBox(
                                      width: 50,
                                      height:
                                          70, 
                                      child: Column(
                                        children: [
                                          Text("${index + 1}"),
                                          Text(
                                              '${state.todaysList.temperatureList[index]}')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            : const Scaffold(
                body: Center(
                  child: Text('data'),
                ),
              );
      },
    );
  }
}

class _CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 50);
    path.quadraticBezierTo(width, 0, width - 50, 0);
    path.quadraticBezierTo(width * .5, 25, 50, 0);
    path.quadraticBezierTo(0, 0, 0, 50);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
