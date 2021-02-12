// ProductItemCart(
//     {this.typeOfProduct,
//     @required this.productTitle,
//     @required this.productAmount,
//     @required this.productPrice,
//     @required this.productImage,
//     @required this.productDescription,
//     @required this.productSize});

abstract class CartItem {
  int get title;
  int get amount;
  set amount(int value);
  int get price;
  String get image;
  String get description;
  String get size;
  bool get isLiked;
  set isLiked(bool value);
}
