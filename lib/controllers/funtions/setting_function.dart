import 'package:geolocator/geolocator.dart';
import 'package:my_weather/presentation/bloc/home_page_bloc/home_page_bloc.dart';

class LocationSetting {
  HomePageBloc homePageBloc;

  LocationSetting({required this.homePageBloc});

  void goToSettings() async {
    await Geolocator.openAppSettings();
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      homePageBloc.add(InitHomeEvent());
    }
  }
}
