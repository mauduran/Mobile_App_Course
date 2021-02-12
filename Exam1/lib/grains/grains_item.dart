import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/grains/grains_item_detail.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';

class ItemCoffeeGrains extends StatefulWidget {
  final ProductGrains grain;
  final ProductCart cart;
  ItemCoffeeGrains({
    Key key,
    @required this.grain,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemCoffeeGrainsState createState() => _ItemCoffeeGrainsState();
}

class _ItemCoffeeGrainsState extends State<ItemCoffeeGrains> {
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
                        builder: (context) => CoffeeGrainsDetail(
                          grains: widget.grain,
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
                            width: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Café de Grano",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${widget.grain.productTitle}",
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
                                  "\$${widget.grain.productPrice.round().toString()}",
                                  style: Theme.of(context).textTheme.headline2,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              left: 125,
                              width: 170,
                              height: 140,
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Image.network(
                                  widget.grain.productImage,
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
                    widget.grain.liked = !widget.grain.liked;
                  });
                },
                child: Icon(
                  widget.grain.liked
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
