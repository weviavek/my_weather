class CurrentWeather {
  final int tempC;
  final int tempF;
  final String climateImage;
  final int feelsLikeC;
  final int feelsLikeF;
  final WindData windData;

  CurrentWeather(
      {required this.tempC,
      required this.tempF,
      required this.climateImage,
      required this.feelsLikeC,
      required this.feelsLikeF,
      required this.windData});

  factory CurrentWeather.fromJson(Map<dynamic,dynamic>json){
        return CurrentWeather(tempC:json['temp_c'].round(),
        tempF:json['temp_f'].round(),
        climateImage:'',
        feelsLikeC:json['feelslike_c'].round(),
        feelsLikeF:json['feelslike_f'].round(),
        windData:WindData(windDirection: json['wind_dir'], windSpeed: '${json['wind_kph']} kph')
      );
      }
}

class WindData {
  final String windDirection;
  final String windSpeed;
  WindData({required this.windDirection, required this.windSpeed});
}
