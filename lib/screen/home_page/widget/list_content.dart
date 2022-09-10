import 'package:flutter/material.dart';
import 'package:restoran_app/data/models/restaurant.dart';

// ignore: must_be_immutable
class ListContent extends StatelessWidget {
  Restaurant restaurant;
  ListContent({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  restaurant.smallpictureUrl,
                  height: MediaQuery.of(context).size.width * .5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                )),
            Container(
              height: MediaQuery.of(context).size.width * .5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(128, 0, 0, 0),
                    Color.fromARGB(128, 34, 34, 34),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.location_pin,
                            size: 18,
                            color: Color.fromARGB(255, 235, 234, 234),
                          ),
                        ),
                        TextSpan(
                          text: restaurant.city,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 235, 234, 234),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.star,
                            size: 18,
                            color: Color.fromARGB(255, 235, 234, 234),
                          ),
                        ),
                        TextSpan(
                          text: restaurant.rating.toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 235, 234, 234),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
