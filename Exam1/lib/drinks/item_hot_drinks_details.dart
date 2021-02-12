import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

class HotDrinkDetail extends StatefulWidget {
  final ProductHotDrinks drink;
  final ProductCart cart;
  HotDrinkDetail({
    Key key,
    @required this.drink,
    @required this.cart,
  }) : super(key: key);

  @override
  _HotDrinkDetailState createState() => _HotDrinkDetailState();
}

class _HotDrinkDetailState extends State<HotDrinkDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.drink.productTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 40, 40, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        c_orange_light,
                        Theme.of(context).accentColor,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.network(widget.drink.productImage),
                            ),
                          ),
                        ],
                      )
                    ],
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
            SizedBox(
              height: 25,
            ),
            Text(
              widget.drink.productTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.drink.productDescription,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Open Sans'),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      "\$${widget.drink.productPrice.truncate()}",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    right: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'TAMAÑOS DISPONIBLES',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      // ProductSize
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: ChoiceChip(
                                  label: Text('Chico'),
                                  selected: widget.drink.productSize ==
                                      ProductSize.CH,
                                  onSelected: (bool val) {
                                    if (widget.drink.productSize !=
                                        ProductSize.CH) {
                                      setState(() {
                                        widget.drink.productSize =
                                            ProductSize.CH;
                                        widget.drink.productPrice = widget.drink
                                            .productPriceCalculator();
                                      });
                                    }
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ChoiceChip(
                                  label: Text('Mediano'),
                                  selected:
                                      widget.drink.productSize == ProductSize.M,
                                  onSelected: (bool val) {
                                    if (widget.drink.productSize !=
                                        ProductSize.M) {
                                      setState(() {
                                        widget.drink.productSize =
                                            ProductSize.M;
                                        widget.drink.productPrice = widget.drink
                                            .productPriceCalculator();
                                      });
                                    }
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ChoiceChip(
                                label: Text('Grande'),
                                selected:
                                    widget.drink.productSize == ProductSize.G,
                                onSelected: (bool val) {
                                  setState(() {
                                    if (widget.drink.productSize !=
                                        ProductSize.G) {
                                      widget.drink.productSize = ProductSize.G;
                                      widget.drink.productPrice =
                                          widget.drink.productPriceCalculator();
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    widget.cart.addItemToCart(drink: widget.drink);
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text('El producto se ha agregado al carrito'),
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
                  child: Text(
                    "AGREGAR AL CARRITO",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pay');
                  },
                  child: Text(
                    "COMPRAR AHORA",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
