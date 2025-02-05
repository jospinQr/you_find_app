import 'package:you_app/domain/model/Product.dart';

class CartItem {
  final Product product;
  int qt;

  CartItem({required this.product, this.qt = 1});
}
