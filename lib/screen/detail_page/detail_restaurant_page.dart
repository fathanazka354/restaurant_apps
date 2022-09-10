import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app/constant/result_state.dart';
import 'package:restoran_app/data/models/restaurant.dart';
import 'package:restoran_app/data/provider/resto_detail_provider.dart';
import 'package:restoran_app/data/response/resto_detail_response.dart';
import 'package:restoran_app/screen/detail_page/widget/image_section.dart';
import 'package:restoran_app/screen/detail_page/widget/slide_makanan.dart';
import 'package:restoran_app/screen/detail_page/widget/slide_minuman.dart';

class DetailRestaurantPage extends StatefulWidget {
  static const String routeName = '/detail_page';
  const DetailRestaurantPage({Key? key, required this.restaurant})
      : super(key: key);

  final String restaurant;

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  void initState() {
    Future.microtask(() {
      RestoDetailProvider provider =
          Provider.of<RestoDetailProvider>(context, listen: false);
      provider.getDetails(widget.restaurant);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Consumer<RestoDetailProvider>(
          builder: (context, provider, _) {
            ResultState<RestoDetailResponse> state = provider.state;
            switch (state.status) {
              case Status.loading:
                return const CircularProgressIndicator();
              case Status.error:
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    child: const Text('Ulangi lagi'),
                    onPressed: () {},
                  ),
                ));
              case Status.hasData:
                Restaurant restaurant = state.data!.restaurant;
                return Text(restaurant.name);
            }
          },
        ),
      ),
      body: Consumer<RestoDetailProvider>(
        builder: (context, provider, _) {
          ResultState<RestoDetailResponse> state = provider.state;
          switch (state.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.error:
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('Ulangi lagi'),
                  onPressed: () {},
                ),
              ));
            case Status.hasData:
              Restaurant restaurant = state.data!.restaurant;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ImageSections(restaurant: restaurant),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_pin),
                              Text(restaurant.city)
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(restaurant.description),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Text(
                            "Rating: ${restaurant.rating.toString()}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          const Text(
                            'Menu',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: SlideMakanan(
                                restaurant: restaurant,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10),
                              child: SlideMinuman(
                                restaurant: restaurant,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
          }
        },
      ),
    ));
  }
}
