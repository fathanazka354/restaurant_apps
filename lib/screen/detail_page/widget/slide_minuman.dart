import 'package:flutter/material.dart';

import '../../../component/style.dart';
import '../../../data/models/restaurant.dart';

class SlideMinuman extends StatelessWidget {
  final Restaurant restaurant;
  const SlideMinuman({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Minuman: ',
          style: TextStyle(color: darkColor, fontWeight: FontWeight.w500),
        ),
        Row(
          children: restaurant.menus.drinks
              .map((drink) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 55, 42, 234),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        drink.name,
                        style: const TextStyle(color: primaryColor),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
