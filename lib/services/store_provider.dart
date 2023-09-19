import 'package:fluent_ui/fluent_ui.dart';
import 'package:home_manager/models/product.dart';
import 'package:home_manager/models/room.dart';

class StoreProvider with ChangeNotifier {
  List<Product> products = [];
  List<Room> rooms = [];

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void deleteProduct(index) {
    products.removeAt(index);
    notifyListeners();
  }

  void addRoom(Room room) {
    rooms.add(room);
    notifyListeners();
  }

  void deleteRoom(index) {
    rooms.removeAt(index);
    notifyListeners();
  }
}
