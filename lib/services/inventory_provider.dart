import 'package:fluent_ui/fluent_ui.dart';
import 'package:home_manager/models/product.dart';

class InventoryProvider with ChangeNotifier {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void deleteProduct(index) {
    products.removeAt(index);
    notifyListeners();
  }
}
