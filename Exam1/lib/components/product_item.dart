import 'package:estructura_practica_1/colors.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/');
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
                                  "Café",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${widget.drink.productTitle}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  "\$${widget.drink.productPrice.round().toString()}",
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
                                fit: BoxFit.fill,
                                child: Image.network(
                                  widget.drink.productImage,
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
                    widget.drink.liked = !widget.drink.liked;
                  });
                },
                child: Icon(
                  widget.drink.liked
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
}
