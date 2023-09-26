class HourlyList {
  final List<double> temperatureList;
  HourlyList({required this.temperatureList});
  factory HourlyList.addFromJson(Map<dynamic, dynamic> json) {
    final List<dynamic> hourlyData =
        json['forecast']['forecastday'][0]['hour'];

    List<double> temperatureList = hourlyData.map<double>((json) {
          return double.tryParse(json['temp_c'].toString()) ?? 0.0;
        }).toList();

    return HourlyList(temperatureList: temperatureList);
  }
}
