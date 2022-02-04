class SearchedCityCordinateModel {
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? state;

  SearchedCityCordinateModel(
      {this.name, this.lat, this.lon, this.country, this.state});

  SearchedCityCordinateModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }
}
