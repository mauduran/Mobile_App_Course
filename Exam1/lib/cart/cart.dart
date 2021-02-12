import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';

import '../profile/profile.dart';

class Cart extends StatefulWidget {
  final ProductCart cart;
  Cart({
    Key key,
    @required this.cart,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    for (var item in widget.cart.items) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * .8,
        child: Drawer(child: Profile()),
      ),
      appBar: AppBar(
        title: Text(PROFILE_CART),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 32, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              child: (widget.cart.items.length == 0)
                  ? Center(
                      child: Text(
                        "Tu carrito está vacío",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.cart.items.length,
                      itemBuilder: (BuildContext context, int idx) {
                        return ItemCart(
                            onAmountUpdated: _priceUpdate,
                            product: widget.cart.items[idx],
                            remove: _removeItem);
                      },
                    ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  "$_total MX\$",
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("PAGAR"),
                    onPressed: () {
                      if (_total > 0) {
                        Navigator.pushNamed(
                          context,
                          '/pay',
                          arguments: <String, String>{
                            "total": _total.toString()
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }

  void _removeItem(ProductItemCart item) {
    widget.cart.removeItemFromCart(item);
    setState(() {});
  }
}
