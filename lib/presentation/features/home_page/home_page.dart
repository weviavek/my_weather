import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/controllers/dialogs/mannual_permission.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:my_weather/controllers/dialogs/error_dialog.dart';
import 'package:my_weather/presentation/features/home_page/home_page_body.dart';
import 'package:my_weather/presentation/features/home_page/homepage_app_bar.dart';

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
        if (state is HomePageErroeState) ErrorDialog.show(context);
        if (state is HomePermissionDeniedState) {
          isShowing = true;
          LocationSettingDialog(homePageBloc: homePageBloc).show(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: CustomScrollView(
            slivers: [
              state is HomePageLoadedState
                  ? HomePageAppBar(state: state)
                  : SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height * 0.7,
                      floating: false,
                      flexibleSpace:
                          const Center(child: CircularProgressIndicator())),
              state is HomePageLoadedState
                  ? HomePageBody(state: state)
                  : const SliverToBoxAdapter(
                      child: Center(
                        child: Text('data'),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
