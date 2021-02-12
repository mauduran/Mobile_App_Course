import 'package:estructura_practica_1/grains/grains_item.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/profile/profile.dart';
import 'package:flutter/material.dart';

class CoffeeGrainsPage extends StatefulWidget {
  final List<ProductGrains> grainsList;
  final ProductCart cart;

  CoffeeGrainsPage({
    Key key,
    @required this.grainsList,
    @required this.cart,
  }) : super(key: key);

  @override
  _CoffeeGrainsPageState createState() => _CoffeeGrainsPageState();
}

class _CoffeeGrainsPageState extends State<CoffeeGrainsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos de Café"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart').whenComplete(
                    () => _refresh(),
                  );
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
          itemCount: widget.grainsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemCoffeeGrains(
              grain: widget.grainsList[index],
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
