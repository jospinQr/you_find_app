import 'dart:ffi';

class Product {
  final int id;
  final String designation;
  final double price;
  final String categorie;
  final String imgUrl;

  Product({
    required this.id,
    required this.designation,
    required this.price,
    required this.categorie,
    required this.imgUrl,
  });
}
