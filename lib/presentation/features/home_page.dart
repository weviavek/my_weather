import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:my_weather/presentation/dialogs/error_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageBloc homePageBloc = HomePageBloc();
  @override
  void initState() {
    homePageBloc.add(InitHomeEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      listener: (context, state) {
        if (state is HomePageLoadedState) ErrorDialog.show(context);
        if (state is HomePageLoadedState) print(state.todaysList.temperatureList);
        
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.7,
                floating: false,
                flexibleSpace: Stack(fit: StackFit.expand, children: [
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
                        )),
                  ),
                ]),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 0,
                          style: BorderStyle.none)),
                  height: MediaQuery.sizeOf(context).height * .6,
                ),
              ),
            ],
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
