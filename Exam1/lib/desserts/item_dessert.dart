import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

import 'item_dessert_detail.dart';

class ItemDessert extends StatefulWidget {
  final ProductDessert dessert;
  final ProductCart cart;
  ItemDessert({
    Key key,
    @required this.dessert,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemDessertState createState() => _ItemDessertState();
}

class _ItemDessertState extends State<ItemDessert> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => ItemDessertDetail(
                          dessert: widget.dessert,
                          cart: widget.cart,
                        ),
                      ),
                    )
                    .whenComplete(() => _refresh());
              },
              child: Card(
                elevation: 5,
                color: c_brown_light,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 24, 12, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Postre",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${widget.dessert.productTitle}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  "\$${widget.dessert.productPrice.round().toString()}",
                                  style: Theme.of(context).textTheme.headline2,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              left: 130,
                              width: 160,
                              height: 140,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(
                                  widget.dessert.productImage,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: 12,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.dessert.liked = !widget.dessert.liked;
                  });
                },
                child: Icon(
                  widget.dessert.liked
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _refresh() {
    setState(() {});
  }
}
