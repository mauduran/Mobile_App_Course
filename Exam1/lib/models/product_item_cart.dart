import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  String productImage;
  String productDescription;
  String productSize;
  final ProductType typeOfProduct;
  Function toggleLike;
  bool isLiked;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
    @required this.productImage,
    @required this.productDescription,
    @required this.productSize,
    @required this.isLiked,
    @required this.toggleLike,
  });
}
