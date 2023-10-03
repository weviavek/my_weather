import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';

import 'presentation/features/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(create: (context) => HomePageBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlueAccent.shade700),
            useMaterial3: true,
            dividerColor: Colors.white,
            scaffoldBackgroundColor: Colors.white),
        home: const HomePage(),
      ),
    );
  }
}
