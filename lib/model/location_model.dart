class LocationModel {
  final String currentLocation;
  final String country;
  final String localTime;
  LocationModel(
      {required this.currentLocation,
      required this.country,
      required this.localTime});
  factory LocationModel.fromJson(Map<dynamic, dynamic> json) {
    return LocationModel(
        currentLocation: json['name'],
        country: json['country'],
        localTime: json['localtime']);
  }
}
