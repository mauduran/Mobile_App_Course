import 'package:estructura_practica_1/account_access/account_access_page.dart';
import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/login/login.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment/payment_page.dart';
import 'package:estructura_practica_1/profile/profile_page.dart';
import 'package:estructura_practica_1/sign_up/sign_up_page.dart';
import 'package:estructura_practica_1/splash/splash_screen.dart';
import 'package:estructura_practica_1/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';

import 'utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cart = ProductCart();
  final hotDrinks = ProductRepository.loadProducts(ProductType.BEBIDAS);
  final grains = ProductRepository.loadProducts(ProductType.GRANO);
  final desserts = ProductRepository.loadProducts(ProductType.POSTRES);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: buildAppTheme(),
      initialRoute: '/splash',
      routes: {
        '/': (context) => Home(title: APP_TITLE),
        '/access': (context) => AccountAccessPage(),
        '/splash': (context) => SplashScreen(),
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/profile': (context) => ProfilePage(),
        '/pay': (context) => PaymentPage(),
        '/cart': (context) => Cart(cart: cart),
        '/hotdrinks': (context) => HotDrinksPage(
              drinksList: hotDrinks,
              cart: cart,
            ),
        '/grains': (context) => CoffeeGrainsPage(
              grainsList: grains,
              cart: cart,
            ),
        '/desserts': (context) => DessertsPage(
              dessertsList: desserts,
              cart: cart,
            ),
      },
    );
  }
}
