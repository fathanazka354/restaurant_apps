import 'package:flutter/material.dart';
import 'package:restoran_app/data/models/restaurant.dart';

import '../../../component/style.dart';

class SlideMakanan extends StatelessWidget {
  final Restaurant restaurant;
  const SlideMakanan({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Makanan: ',
          style: TextStyle(color: darkColor, fontWeight: FontWeight.w500),
        ),
        Row(
          children: restaurant.menus.foods
              .map((food) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 137, 105, 2),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        food.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
              .toList(),
          // children: [
          //   Text(data)
          // ],
        ),
      ],
    );
  }
}
