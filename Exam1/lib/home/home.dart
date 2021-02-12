import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile/profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * .8,
        child: Drawer(child: Profile()),
      ),
      appBar: AppBar(
        title: Text('Inicio'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "hot_drinks.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              _openDessertPage();
            },
            child: ItemHome(
              title: "Postres",
              image: "desserts.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "grains.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text("Proximamente..."),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: "Close",
                    onPressed: () {
                      _scaffoldKey.currentState.hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            },
            child: ItemHome(
              title: "Tazas",
              image: "coming_soon.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).pushNamed('/hotdrinks');
  }

  void _openGrainsPage() {
    Navigator.of(context).pushNamed('/grains');
  }

  void _openDessertPage() {
    Navigator.of(context).pushNamed('/desserts');
  }
}
