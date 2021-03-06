import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

class ItemDessertDetail extends StatefulWidget {
  final ProductDessert dessert;
  final ProductCart cart;
  ItemDessertDetail({
    Key key,
    @required this.dessert,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemDessertDetailState createState() => _ItemDessertDetailState();
}

class _ItemDessertDetailState extends State<ItemDessertDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.dessert.productTitle),
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
                              child: Image.network(widget.dessert.productImage),
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
            SizedBox(
              height: 25,
            ),
            Text(
              widget.dessert.productTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.dessert.productDescription,
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
                      "\$${widget.dessert.productPrice.truncate()}",
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
                                  selected: widget.dessert.productSize ==
                                      ProductSize.CH,
                                  onSelected: (bool val) {
                                    if (widget.dessert.productSize !=
                                        ProductSize.CH) {
                                      setState(() {
                                        widget.dessert.productSize =
                                            ProductSize.CH;
                                        widget.dessert.productPrice = widget
                                            .dessert
                                            .productPriceCalculator();
                                      });
                                    }
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ChoiceChip(
                                  label: Text('Mediano'),
                                  selected: widget.dessert.productSize ==
                                      ProductSize.M,
                                  onSelected: (bool val) {
                                    if (widget.dessert.productSize !=
                                        ProductSize.M) {
                                      setState(() {
                                        widget.dessert.productSize =
                                            ProductSize.M;
                                        widget.dessert.productPrice = widget
                                            .dessert
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
                                    widget.dessert.productSize == ProductSize.G,
                                onSelected: (bool val) {
                                  setState(() {
                                    if (widget.dessert.productSize !=
                                        ProductSize.G) {
                                      widget.dessert.productSize =
                                          ProductSize.G;
                                      widget.dessert.productPrice = widget
                                          .dessert
                                          .productPriceCalculator();
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
                    widget.cart.addItemToCart(dessert: widget.dessert);
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
