import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app/component/navigation.dart';
import 'package:restoran_app/data/api/api_service.dart';
import 'package:restoran_app/data/provider/resto_detail_provider.dart';
import 'package:restoran_app/data/provider/resto_list_provider.dart';
import 'package:restoran_app/data/provider/resto_search_provider.dart';
import 'package:restoran_app/screen/detail_page/detail_restaurant_page.dart';
import 'package:restoran_app/screen/home_page/home.dart';
import 'package:restoran_app/screen/splash.dart';
import 'package:restoran_app/component/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestoListProvider>(
            create: (_) => RestoListProvider(apiService: _apiService)),
        ChangeNotifierProvider<RestoSearchProvider>(
            create: (_) => RestoSearchProvider(apiService: _apiService)),
        ChangeNotifierProvider<RestoDetailProvider>(
            create: (_) => RestoDetailProvider(apiService: _apiService))
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: primaryColor,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.blue)),
        initialRoute: SplashScreen.routeName,
        navigatorKey: navigatorKey,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          Home.routeName: (_) => const Home(),
          DetailRestaurantPage.routeName: (context) => DetailRestaurantPage(
                restaurant:
                    ModalRoute.of(context)?.settings.arguments as String,
              ),
        },
      ),
    );
  }
}
