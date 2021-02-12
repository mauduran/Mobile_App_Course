import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class ProductCart {
  List<ProductItemCart> items = [];

  ProductCart();

  void addItemToCart(
      {ProductHotDrinks drink, ProductGrains grains, ProductDessert dessert}) {
    if (drink != null) {
      this._addDrinkToCart(drink);
    }
    if (grains != null) {
      this._addGrainsToCart(grains);
    }
    if (dessert != null) {
      this._addDessertToCart(dessert);
    }
  }

  void removeItemFromCart(ProductItemCart product) {
    this.items.remove(product);
  }

  void _addDrinkToCart(ProductHotDrinks product) {
    ProductItemCart existingProd = this.items.firstWhere(
        (element) =>
            element.productTitle == product.productTitle &&
            element.productSize == product.genericSize,
        orElse: () => null);

    if (existingProd != null) {
      existingProd.productAmount += 1;
    } else {
      this.items.add(ProductItemCart(
            productTitle: product.productTitle,
            productAmount: 1,
            productPrice: product.productPrice,
            productImage: product.productImage,
            productDescription: product.productDescription,
            productSize: product.genericSize,
            isLiked: product.liked,
            toggleLike: () => product.liked = !product.liked,
          ));
    }
  }

  void _addDessertToCart(ProductDessert product) {
    ProductItemCart existingProd = this.items.firstWhere(
        (element) =>
            element.productTitle == product.productTitle &&
            element.productSize == product.genericSize,
        orElse: () => null);

    if (existingProd != null) {
      existingProd.productAmount += 1;
    } else {
      this.items.add(ProductItemCart(
            productTitle: product.productTitle,
            productAmount: 1,
            productPrice: product.productPrice,
            productImage: product.productImage,
            productDescription: product.productDescription,
            productSize: product.genericSize,
            isLiked: product.liked,
            toggleLike: () => product.liked = !product.liked,
          ));
    }
  }

  void _addGrainsToCart(ProductGrains product) {
    ProductItemCart existingProd = this.items.firstWhere(
        (element) =>
            element.productTitle == product.productTitle &&
            element.productSize == product.genericSize,
        orElse: () => null);

    if (existingProd != null) {
      existingProd.productAmount += 1;
    } else {
      this.items.add(ProductItemCart(
            productTitle: product.productTitle,
            productAmount: 1,
            productPrice: product.productPrice,
            productImage: product.productImage,
            productDescription: product.productDescription,
            productSize: product.genericSize,
            isLiked: product.liked,
            toggleLike: () => product.liked = !product.liked,
          ));
    }
  }
}
