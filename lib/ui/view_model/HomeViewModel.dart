import 'package:flutter/cupertino.dart';
import 'package:you_app/domain/model/CartItem.dart';
import 'package:you_app/domain/model/Product.dart';

class HomeViewModel with ChangeNotifier {
  List<CartItem> _cartItem = [];

  List<CartItem> get cartItem => _cartItem;

  int _qt = 0;

  int get qt => _qt;

  double get totalAmount {
    double total = 0;
    for (var item in _cartItem) {
      total += item.product.price * item.qt;
    }
    return total;
  }

  void addItem(Product product) {
    final existingItem = _cartItem.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(
        product: Product(
          id: -1,
          designation: '',
          categorie: '',
          price: 0,
          imgUrl: '',
        ),
      ),
    );
    if (existingItem.product.id != -1) {
      existingItem.qt++;
    } else {
      _cartItem.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    _cartItem.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateItemQuantity(int productId, int quantity) {
    final existingItem =
        _cartItem.firstWhere((item) => item.product.id == productId);
    existingItem.qt = quantity;
    notifyListeners();
  }

  void incrementQt() {
    _qt++;
    notifyListeners();
  }

  void decrementQt() {
    _qt--;
    notifyListeners();
  }

  void resetQt() {
    _qt = 0;
    notifyListeners();
  }
}
