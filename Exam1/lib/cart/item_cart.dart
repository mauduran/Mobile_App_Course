import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final ValueChanged<double> onAmountUpdated;
  final Function remove;
  ItemCart(
      {Key key,
      @required this.onAmountUpdated,
      @required this.product,
      @required this.remove})
      : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15),
        height: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              c_orange_light,
              Theme.of(context).accentColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: Image.network(
                    widget.product.productImage,
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(top: 5, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.product.productTitle,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                      Text(
                        widget.product.productSize,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.white),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: _remProd,
                              ),
                              Text("${widget.product.productAmount}"),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: _addProd,
                              ),
                            ],
                          ),
                          Text(
                            "\$${widget.product.productPrice.round()}",
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  widget.product.toggleLike();
                  setState(() {
                    widget.product.isLiked = !widget.product.isLiked;
                  });
                },
                child: Icon(
                  widget.product.isLiked
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  onTap: () {
                    _removeAllProd();
                    widget.remove(widget.product);
                  },
                  child: Icon(Icons.delete)),
            ),
          ],
        ));
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _removeAllProd() {
    if (widget.product.productAmount > 0) {
      widget.onAmountUpdated(
          -1 * widget.product.productAmount * widget.product.productPrice);
    }
  }

  void _remProd() {
    if (widget.product.productAmount > 0) {
      widget.onAmountUpdated(-1 * widget.product.productPrice);
      if (widget.product.productAmount == 1) {
        widget.remove(widget.product);
      } else {
        setState(() {
          --widget.product.productAmount;
        });
      }
    }
  }
}
