import 'dart:math';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/foundation.dart';

class ProductDessert {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductSize productSize; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductDessert({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productSize,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo a la size del producto
    productPrice = productPriceCalculator();
  }

  String get genericSize {
    switch (this.productSize) {
      case ProductSize.CH:
        return "Tamaño chico";
      case ProductSize.M:
        return "Tamaño mediano";
      case ProductSize.G:
        return "Tamaño grande";
      default:
        return '';
    }
  }

  double productPriceCalculator() {
    if (this.productSize == ProductSize.CH)
      return (20 + Random().nextInt(30)).toDouble();
    if (this.productSize == ProductSize.M)
      return (40 + Random().nextInt(60)).toDouble();
    if (this.productSize == ProductSize.G)
      return (60 + Random().nextInt(120)).toDouble();
    return 999.0;
  }
}
