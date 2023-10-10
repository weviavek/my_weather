import 'package:my_weather/controllers/funtions/fundamental_functions.dart';

class AnimationImageHelper {
  static String clearAnimation = 'assets/animation_images/moon.png';
  static String sunnyAndCloudyAnimation =
      'assets/animation_images/cloud_sun.png';
  static String cloudRainLightningAnimation =
      'assets/animation_images/cloud_rain_lighting.png';
  static String cloudRainAnimation = 'assets/animation_images/cloud_rain.png';
  static String cloudSnowAnimation = 'assets/animation_images/cloud_snow.png';
  static String cloudSunRainAnimation =
      'assets/animation_images/cloud_sun_rain.png';
  static String cloudyAnimation = 'assets/animation_images/cloud.png';
  static String getImage(String condition) {
    switch (condition) {
      case "Sunny" || "Partly cloudy":
        return sunnyAndCloudyAnimation;
      case "Clear":
        return clearAnimation;
      case "Overcast":
        return cloudyAnimation;
      case "Thundery outbreaks in nearby":
        return cloudRainLightningAnimation;
    }
    if (condition.toLowerCase().contains('thunder')) {
      return cloudRainLightningAnimation;
    } else if (condition.toLowerCase().contains('rain')) {
      return cloudRainAnimation;
    } else if (condition.toLowerCase().contains('ice')) {
      return cloudSnowAnimation;
    } else if (condition.toLowerCase().contains('sonw')) {
      return cloudSnowAnimation;
    } else {
      return cloudyAnimation;
    }
  }
}

class BackgroudImageHelper {
  static String clearMoon =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fclear_moon.png?alt=media&token=2d5c9624-728a-4e42-9df7-0179fe004f7d&_gl=1*12s8wk4*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODcwNzMuMS4wLjA.';
  static String cloudMoon =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fcloudy_moon_.png?alt=media&token=afe4de71-dc66-45f7-b423-6f192b711cf8&_gl=1*tne6oo*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc0NzcuNjAuMC4w';
  static String drizzle =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fdrizzle.png?alt=media&token=7f526738-9b56-452e-811b-518c61de136b&_gl=1*zblo6v*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc1MzkuNjAuMC4w';
  static String heavyRain =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fheavy_rainy.png?alt=media&token=101f257b-2e64-44e2-9ddf-feb681493757&_gl=1*xt3fp9*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc1NzcuMjIuMC4w';
  static String icePellets =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fice_pellets.png?alt=media&token=d0d595d3-71d8-4654-83f8-9fd7c7667901&_gl=1*9w3spv*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc1OTkuNjAuMC4w';
  static String mist =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fmist.png?alt=media&token=48a6a640-8bd7-438c-9ed5-a5b23dfeb5b0&_gl=1*11611y9*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc2MzMuMjYuMC4w';
  static String snow =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fmoderate_snow.png?alt=media&token=65a3ba82-4eea-45fc-b581-6f62f8dc754a&_gl=1*zb8f90*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc2NTMuNi4wLjA.';
  static String overcast =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fovercast.png?alt=media&token=cb97b348-800d-4457-b9ac-cb78c4881080&_gl=1*13qee7s*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc2ODAuNjAuMC4w';
  static String patchyRain =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fpatchy_rain.png?alt=media&token=6ae709f0-e5e5-45bf-b59d-8d7f2faadbcb&_gl=1*1tzjqy7*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc2OTYuNDQuMC4w';
  static String rainThunder =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fpatchy_rain_with_thunder.png?alt=media&token=d2b74304-186d-4d0c-9eba-02c82dc301e8&_gl=1*1nq4fxr*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc3MjEuMTkuMC4w';
  static String snowThunder =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fpatchy_snow_with_thunder.png?alt=media&token=f6c5f821-7981-419b-ac04-5e0ae5d55f71&_gl=1*10hhlga*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc3NDUuNjAuMC4w';
  static String sleet =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fsleet.png?alt=media&token=9b09279d-6efd-4aa9-a41c-f8e727d57b0a&_gl=1*eogz1s*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc3NjguMzcuMC4w';
  static String sunny =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fsunny.png?alt=media&token=4087ada9-a5b6-478f-9ee8-b52abd360b3e&_gl=1*crrqcx*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc4MDIuMy4wLjA.';
  static String sunnyCloud =
      'https://firebasestorage.googleapis.com/v0/b/my-weather-62663.appspot.com/o/images%2Fsunny_day_with_cloud.png?alt=media&token=cc611871-fa30-413d-9bb3-c56d2d588efb&_gl=1*1r1k2vw*_ga*MTA3MzI4MzMyNy4xNjkyMTM1Njg0*_ga_CW55HF8NVT*MTY5NjQ4NjU1OS4zMy4xLjE2OTY0ODc4MjkuNjAuMC4w';

  static String getImage(String condition) {
    Map<String, String> imageMap = {
      "Sunny": sunny,
      "Clear": clearMoon,
      "Partly cloudy": GetData.time() < 16 ? cloudMoon : sunnyCloud,
      "Cloudy": sunnyCloud,
      "Overcast": overcast,
      "Mist": mist,
      "Patchy rain nearby": patchyRain,
      "Patchy sleet nearby": sleet,
      "Patchy freezing drizzle nearby": drizzle,
      "Thundery outbreaks in nearby": rainThunder,
      "Blowing snow": snow,
      "Blizzard": snow,
      "Fog": mist,
      "Freezing fog": mist,
      "Patchy light drizzle": drizzle,
      "Light drizzle": drizzle,
      "Freezing drizzle": drizzle,
      "Heavy freezing drizzle": drizzle,
      "Patchy light rain": patchyRain,
      "Light rain": patchyRain,
      "Moderate rain at times": heavyRain,
      "Moderate rain": rainThunder,
      "Heavy rain at times": heavyRain,
      "Heavy rain": heavyRain,
      "Light freezing rain": rainThunder,
      "Moderate or heavy freezing rain": heavyRain,
      "Light sleet": sleet,
      "Moderate or heavy sleet": sleet,
      "Patchy light snow": snow,
      "Light snow": snow,
      "Patchy moderate snow": snow,
      "Moderate snow": snow,
      "Patchy heavy snow": snow,
      "Heavy snow": snow,
      "Ice pellets": icePellets,
      "Light rain shower": rainThunder,
      "Moderate or heavy rain shower": heavyRain,
      "Torrential rain shower": heavyRain,
      "Light sleet showers": sleet,
      "Moderate or heavy sleet showers": sleet,
      "Light snow showers": snow,
      "Moderate or heavy snow showers": snow,
      "Light showers of ice pellets": icePellets,
      "Moderate or heavy showers of ice pellets": icePellets,
      "Patchy light rain in area with thunder": rainThunder,
      "Moderate or heavy rain in area with thunder": heavyRain,
      "Patchy light snow in area with thunder": snowThunder,
      "Moderate or heavy snow in area with thunder": snowThunder
    };

    return imageMap[condition] ?? sunny;
  }
}
