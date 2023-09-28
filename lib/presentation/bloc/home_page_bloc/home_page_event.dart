part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

final class InitHomeEvent extends HomePageEvent {
}

final class LoadedHomePageEvent extends HomePageEvent {}