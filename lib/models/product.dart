import 'package:uuid/uuid.dart';

class Product {
  String id = "";
  String name;
  String url;
  double price;

  Product({
    this.name = "Default Product",
    this.url = "",
    this.price = 0,
  }) {
    id = const Uuid().v4();
  }
}

class ProductEntry {
  Product product;
  int quantity;

  ProductEntry({
    required this.product,
    this.quantity = 0,
  });
}
