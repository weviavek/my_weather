part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

final class InitHomeEvent extends HomePageEvent {
  InitHomeEvent() {
    debugPrint('initCalled');
  }
}

final class LoadedHomePageEvent extends HomePageEvent {}
