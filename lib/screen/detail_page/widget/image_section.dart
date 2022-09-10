// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:restoran_app/data/models/restaurant.dart';

// ignore: must_be_immutable
class ImageSections extends StatelessWidget {
  Restaurant restaurant;
  ImageSections({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: restaurant.pictureId,
        child: Image.network(restaurant.largepictureUrl));
  }
}
