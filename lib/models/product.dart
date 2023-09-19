class Product {
  String id;
  String name;
  String url;
  double price;

  Product({
    this.id = "",
    this.name = "Default Product",
    this.url = "",
    this.price = 0,
  });
}

class ProductEntry {
  Product product;
  int quantity;

  ProductEntry({
    required this.product,
    this.quantity = 0,
  });
}
