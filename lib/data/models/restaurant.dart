import 'dart:convert';

import 'package:restoran_app/constant/constant.dart';
import 'package:restoran_app/data/models/menus.dart';

ListRestaurant listRestaurantFromJson(String str) =>
    ListRestaurant.fromJson(json.decode(str));

String localRestaurantToJson(ListRestaurant data) => json.encode(data.toJson());

class ListRestaurant {
  bool error;
  final String message;
  final int count;
  List<Restaurant> restaurants;

  ListRestaurant({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory ListRestaurant.fromJson(Map<String, dynamic> json) => ListRestaurant(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restaurants: List<Restaurant>.from((json['restaurants'] as List)
          .map((element) => Restaurant.fromJson(element))
          .toList()));

  Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(
            restaurants.map((restaurant) => restaurant.toJson()))
      };
}

class Restaurant {
  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menus});

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;
  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      city: json["city"],
      rating: json["rating"].toDouble(),
      menus: json["menus"] != null
          ? Menus.fromJson(json['menus'])
          : Menus(drinks: [], foods: []));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
  String get smallpictureUrl => '$baseUrl/images/small/$pictureId';
  String get mediumpictureUrl => '$baseUrl/images/medium/$pictureId';
  String get largepictureUrl => '$baseUrl/images/large/$pictureId';
}
