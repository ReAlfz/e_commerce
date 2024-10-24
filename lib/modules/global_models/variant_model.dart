class VariantModel {
  final String name;
  final String? image;
  final int price;

  VariantModel({
    required this.name,
    required this.price,
    this.image,
  });
}
