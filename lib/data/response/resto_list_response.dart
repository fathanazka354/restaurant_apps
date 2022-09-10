import 'package:restoran_app/data/models/restaurant.dart';

class RestoListResponse {
  bool error;
  final String message;
  final int count;
  List<Restaurant> restaurants;

  RestoListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestoListResponse.fromJson(Map<String, dynamic> json) =>
      RestoListResponse(
          error: json['error'],
          message: json['message'],
          count: json['count'],
          restaurants: List<Restaurant>.from((json['restaurants'] as List)
              .map((element) => Restaurant.fromJson(element))).toList());

  Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(
            restaurants.map((restaurant) => restaurant.toJson()))
      };
}
