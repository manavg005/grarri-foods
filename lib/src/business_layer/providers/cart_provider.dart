import 'package:grarri/src/business_layer/providers/base_provider.dart';
import 'package:grarri/src/data_layer/model/model.dart';
// Your model class

class CartProvider extends BaseProvider {
  final Map<String, FoodItem> _items = {};
  final List<List<FoodItem>> _previousOrders = [];

  Map<String, FoodItem> get items => _items;
  List<List<FoodItem>> get previousOrders => _previousOrders;

  void addItem(FoodItem item) {
    if (_items.containsKey(item.name)) {
      _items[item.name]!.quantity++;
    } else {
      _items[item.name] = item..quantity = 1;
    }
    notifyListeners();
  }

  void removeItem(FoodItem item) {
    if (_items.containsKey(item.name) && _items[item.name]!.quantity > 1) {
      _items[item.name]!.quantity--;
    } else {
      _items.remove(item.name);
    }
    notifyListeners();
  }

  int getItemCount(FoodItem item) {
    return _items.containsKey(item.name) ? _items[item.name]!.quantity : 0;
  }

  /// Method to get total count of all items in the cart
  int getTotalItemCount() {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  // Method to convert cart items to an order and clear the cart
  List<FoodItem> getCurrentOrder() {
    return _items.values.toList();
  }

  /// Method to clear the cart after placing an order
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  /// Method to add the cart items to previous order list after placing an order
  void addOrder(List<FoodItem> order) {
    _previousOrders.add(order);
    notifyListeners();
  }
}
