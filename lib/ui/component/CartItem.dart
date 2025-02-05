import 'package:flutter/material.dart';
import '../../domain/model/CartItem.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final int qt;

  const CartItemCard({super.key, required this.cartItem, required this.qt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(
                  "images/${cartItem.product.imgUrl}",
                  width: 70,
                  height: 70,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.product.designation,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    Text(cartItem.product.categorie),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.close,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  children: [
                    InkWell(onTap: () {}, child: Icon(Icons.remove)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(qt.toString()),
                    ),
                    InkWell(onTap: () {}, child: Icon(Icons.add)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
