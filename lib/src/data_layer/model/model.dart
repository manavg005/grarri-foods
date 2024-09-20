class FoodItem {
  final String name;
  final String image;
  final double price;
  final bool isVeg;
  int quantity;

  FoodItem({
    required this.name,
    required this.image,
    required this.price,
    required this.isVeg,
    this.quantity = 0,
  });
}
