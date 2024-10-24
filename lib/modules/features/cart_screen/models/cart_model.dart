class CartModel {
  final int productId;
  final String? variantColor;
  final String? variantSwitch;
  final String title;
  final String description;
  final String images;
  int quantity;
  int price;

  CartModel({
    required this.productId,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.images,
    this.variantSwitch,
    this.variantColor,
  });
}
