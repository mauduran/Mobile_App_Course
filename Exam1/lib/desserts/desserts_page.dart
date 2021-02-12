import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/profile/profile.dart';
import 'package:flutter/material.dart';

import 'item_dessert.dart';

class DessertsPage extends StatefulWidget {
  final List<ProductDessert> dessertsList;
  final ProductCart cart;
  DessertsPage({
    Key key,
    @required this.dessertsList,
    @required this.cart,
  }) : super(key: key);

  @override
  _DessertsPageState createState() => _DessertsPageState();
}

class _DessertsPageState extends State<DessertsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postres"),
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
          itemCount: widget.dessertsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemDessert(
              dessert: widget.dessertsList[index],
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
