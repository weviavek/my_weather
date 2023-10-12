part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitialState extends HomePageState {}

final class HomePageLoadedState extends HomePageState {
  final String loaction;
  final CurrentWeather currentWeather;
  final HourlyList todaysList;
  final LocationModel currentLocationData;
  final DateTime lastUpdatedTime = DateTime.now();

  HomePageLoadedState(
      {required this.loaction,
      required this.currentWeather,
      required this.todaysList,
      required this.currentLocationData});
}

final class HomePageErroeState extends HomePageState {}

final class HomePermissionDeniedState extends HomePageState {}
