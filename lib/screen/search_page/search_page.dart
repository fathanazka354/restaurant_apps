import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app/component/navigation.dart';
import 'package:restoran_app/constant/result_state.dart';
import 'package:restoran_app/data/models/restaurant.dart';
import 'package:restoran_app/data/provider/resto_search_provider.dart';
import 'package:restoran_app/data/response/resto_search_response.dart';
import 'package:restoran_app/screen/detail_page/detail_restaurant_page.dart';

// class SearchPage extends StatefulWidget {
//   static const routeName = '/search_page';
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }

//   // Widget _buildList() {
//   //   Timer? _debounce;
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: const Text('Cari Resto'),
//   //     ),
//   //     body: Column(
//   //       children: [
//   //         Flexible(
//   //             flex: 0,
//   //             child: Padding(
//   //               padding: const EdgeInsets.all(16),
//   //               child: TextField(
//   //                 decoration: const InputDecoration(
//   //                     contentPadding:
//   //                         EdgeInsets.symmetric(vertical: 2, horizontal: 8),
//   //                     label: Text('Cari Resto Disini!'),
//   //                     hintText: 'Masukkan Nama Resto',
//   //                     border: OutlineInputBorder(
//   //                         borderRadius: BorderRadius.all(Radius.circular(16)))),
//   //                 onChanged: (text) {
//   //                   if (_debounce?.isActive ?? false) _debounce!.cancel();
//   //                   _debounce = Timer(const Duration(milliseconds: 500), () {
//   //                     if (text.isNotEmpty) {
//   //                       RestoSearchProvider provider =
//   //                           Provider.of(context, listen: false);
//   //                       provider.getDetail(text);
//   //                     }
//   //                   });
//   //                 },
//   //               ),
//   //             )),
//   //         Flexible(
//   //             flex: 1,
//   //             child: Consumer<RestoSearchProvider>(
//   //               builder: (context, provider, _) {
//   //                 ResultState<RestoSearchResponse> state = provider.state;
//   //                 switch (state.status) {
//   //                   case Status.loading:
//   //                     return const Center(
//   //                       child: CircularProgressIndicator(),
//   //                     );
//   //                   case Status.error:
//   //                     return Center(
//   //                       child: Padding(
//   //                         padding: const EdgeInsets.all(16),
//   //                         child: Text(state.message!),
//   //                       ),
//   //                     );
//   //                   case Status.hasData:
//   //                     {
//   //                       {
//   //                         List<Restaurant> restaurants = state.data!.restaurant;
//   //                         if (restaurants.isEmpty) {
//   //                           return const Center(
//   //                             child: Text('Yang Kamu Cari Ga Ada Nih !!'),
//   //                           );
//   //                         } else {
//   //                           return CardCs(restaurant: restaurants);
//   //                         }
//   //                       }
//   //                     }
//   //                 }
//   //               },
//   //             ))
//   //       ],
//   //     ),
//   //   );
//   // }

//   // Widget _buildIos(BuildContext context) {
//   //   return Scaffold(
//   //     body: _buildList(),
//   //   );
//   // }

//   // Widget _buildAndroid(BuildContext context) {
//   //   return Scaffold(
//   //     body: _buildList(),
//   //   );
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return PlanWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
//   // }

// }

class SearchPage extends SearchDelegate<String> {
  final cities = [
    "Bhanup",
    "Mumbai",
    "Delhi",
    "Pune",
    "Gondang",
    "Sragen",
    "Klaten",
    "Rejo",
    "Rajkot"
  ];
  final recentCities = ["Klaten", "Rejo", "Rajkot"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigation.back(),
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw Exception('Data Kosong');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    RestoSearchProvider provider = Provider.of(context, listen: false);
    if (query.isNotEmpty) {
      provider.getDetail(query);
    } else {
      provider.getDetail("");
    }
    return Consumer<RestoSearchProvider>(
      builder: (context, provider, _) {
        ResultState<RestoSearchResponse> state = provider.state;
        switch (state.status) {
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.error:
            return const Center(child: Text('Data Kosong'));
          case Status.hasData:
            List<Restaurant> restaurants = state.data!.restaurant;
            if (restaurants.isEmpty) {
              return const Text(
                  'Data Kosong, Silahkan Inputkan selain inputan tersebut');
            }
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () => Navigator.pushNamed(
                    context, DetailRestaurantPage.routeName,
                    arguments: restaurants[index].id),
                leading: SizedBox(
                  width: 80,
                  child: Hero(
                    tag: restaurants[index].pictureId,
                    child: Image.network(
                      restaurants[index].smallpictureUrl,
                    ),
                  ),
                ),
                title: RichText(
                    text: TextSpan(
                        text: restaurants[index]
                            .name
                            .substring(0, restaurants[index].name.length),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: restaurants[index]
                              .name
                              .substring(restaurants[index].name.length),
                          style: const TextStyle(color: Colors.grey))
                    ])),
                subtitle: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 18,
                    ),
                    Text(restaurants[index].rating.toString()),
                  ],
                ),
              ),
              itemCount: restaurants.length,
            );
        }
      },
    );
  }
}
