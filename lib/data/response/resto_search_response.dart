import 'package:restoran_app/data/models/restaurant.dart';

class RestoSearchResponse {
  bool error;
  int founded;
  List<Restaurant> restaurant;

  RestoSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurant,
  });

  factory RestoSearchResponse.fromJson(Map<String, dynamic> json) {
    return RestoSearchResponse(
        error: json['error'],
        founded: json['founded'],
        restaurant: List<Restaurant>.from((json['restaurants'] as List)
            .map((e) => Restaurant.fromJson(e))
            .toList()));
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'founded': founded,
        'restaurants': List<dynamic>.from(restaurant.map((e) => e.toJson()))
      };
}
