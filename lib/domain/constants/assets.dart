import '../../controllers/funtions/fundamental_functions.dart';

class Assets {
  static String getDefaultBackgroud() {
    int currentHour = GetData.time();
    return (currentHour > 7 || currentHour < 18)
        ? 'assets/images/default_image_morning.jpg'
        : 'assets/images/default_image_night.jpg';
  }
}
