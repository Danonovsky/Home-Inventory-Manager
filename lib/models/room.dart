import 'package:home_manager/models/product.dart';
import 'package:uuid/uuid.dart';

class Room {
  String id = const Uuid().v4();
  String name;
  List<ProductEntry> products = [];
  double get summaryPrice => products.fold<double>(
      0.0, (_, element) => _ += element.quantity * element.product.price);

  Room({
    this.name = "",
    this.products = const [],
  }) {
    id = const Uuid().v4();
  }
}
