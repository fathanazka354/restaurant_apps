import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restoran_app/component/style.dart';
import 'package:restoran_app/data/models/restaurant.dart';
import 'package:restoran_app/screen/detail_page/detail_restaurant_page.dart';
import 'package:restoran_app/screen/home_page/widget/list_content.dart';
import 'package:restoran_app/screen/widget/plan_widget.dart';

class RestaurantListPage extends StatefulWidget {
  final List<Restaurant> restaurants;
  const RestaurantListPage({Key? key, required this.restaurants})
      : super(key: key);

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  Widget build(BuildContext context) {
    return PlanWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildList(BuildContext context, Restaurant restaurant) {
    return Material(
      color: primaryColor,
      child: GestureDetector(
        onTap: (() => Navigator.pushNamed(
            context, DetailRestaurantPage.routeName,
            arguments: restaurant.id)),
        child: ListContent(restaurant: restaurant),
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return ListView.builder(
      itemCount: widget.restaurants.length,
      itemBuilder: (context, index) {
        Restaurant restaurant = widget.restaurants[index];
        return _buildList(context, restaurant);
      },
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Restaurant App'),
      ),
      child: ListView.separated(
        itemCount: widget.restaurants.length,
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2,
            color: Colors.grey,
          );
        },
        itemBuilder: (context, index) {
          Restaurant restaurant = widget.restaurants[index];
          return _buildList(context, restaurant);
        },
      ),
    );
  }
}
