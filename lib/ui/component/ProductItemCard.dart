import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:you_app/ui/component/CustomerButton.dart';

import '../../domain/model/Product.dart';
import '../view_model/HomeViewModel.dart';
import 'CustomerIconButton.dart';

class ProductItemCard extends StatelessWidget {
  final Product product;
  final int index;

  const ProductItemCard(
      {super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    var homeViewModel = Provider.of<HomeViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(22)),
          color: Colors.grey[100],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                "images/${product.imgUrl}",
                height: 300,
                width: 300,
              ),
            ),
            Row(
              children: [
                Text(
                  product.designation,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "${product.price.toString()} 5\$",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.categorie,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                CustomerIconButton(
                  onClik: () {
                    if (homeViewModel.cartItem.contains(product.id)) {
                      homeViewModel.removeItem(product.id);
                    } else {
                      //  homeViewModel.addToCart(product);

                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Consumer<HomeViewModel>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                    ),
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Definissez la quantité ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomerIconButton(
                                            onClik: () {
                                              value.decrementQt();
                                            },
                                            iconData: Icons.remove,
                                          ),
                                          Text(
                                            value.qt.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 28),
                                          )
                                              .animate(key: ValueKey(value.qt))
                                              .scale(
                                                duration: 300.ms,
                                                curve: Curves.easeOut,
                                              )
                                              .then()
                                              .shake(hz: 3),
                                          CustomerIconButton(
                                            onClik: () {
                                              value.incrementQt();
                                            },
                                            iconData: Icons.add,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      CustomerButton(
                                        textColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        borderColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        onTap: () {
                                          value.addItem(product);
                                          Navigator.pop(context);
                                          //value.resetQt();
                                        },
                                        text: "Ajouter au pagné",
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          });
                    }
                  },
                  iconData: homeViewModel.cartItem.contains(product)
                      ? Icons.remove
                      : Icons.add,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
