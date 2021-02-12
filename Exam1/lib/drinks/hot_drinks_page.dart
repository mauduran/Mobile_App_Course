import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinksPage extends StatefulWidget {
  final List<ProductHotDrinks> drinksList;
  final ProductCart cart;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
    @required this.cart,
  }) : super(key: key);

  @override
  _HotDrinksPageState createState() => _HotDrinksPageState();
}

class _HotDrinksPageState extends State<HotDrinksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/cart')
                  .whenComplete(() => _refresh());
            },
          ),
          Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  )),
        ],
      ),
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * .8,
        child: Drawer(child: Profile()),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 36, 18, 36),
        child: ListView.builder(
          itemCount: widget.drinksList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemHotDrinks(
              drink: widget.drinksList[index],
              cart: widget.cart,
            );
          },
        ),
      ),
    );
  }

  _refresh() {
    setState(() {});
  }
}
