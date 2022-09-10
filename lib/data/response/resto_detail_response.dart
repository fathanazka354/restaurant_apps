import 'package:restoran_app/data/models/restaurant.dart';

class RestoDetailResponse {
  bool error;
  final String message;
  Restaurant restaurant;

  RestoDetailResponse(
      {required this.error, required this.message, required this.restaurant});

  factory RestoDetailResponse.fromJson(Map<String, dynamic> json) {
    return RestoDetailResponse(
        error: json['error'],
        message: json['message'],
        restaurant: Restaurant.fromJson(json['restaurant']));
  }

  Map<String, dynamic> toJson() =>
      {'error': error, 'message': message, 'restaurant': restaurant};
}
