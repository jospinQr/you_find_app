import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:you_app/data/Categorie.dart';
import 'package:you_app/domain/model/Product.dart';
import 'package:you_app/ui/component/CustomerIconButton.dart';
import 'package:you_app/ui/view_model/HomeViewModel.dart';

import '../../data/Product.dart';
import '../component/ProductItemCard.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final List<Categorie> _filters = [
    Categorie("Tout", Icons.all_inclusive_outlined),
    Categorie("Electronique", Icons.electric_bolt),
    Categorie("Habits", Icons.checkroom),
    Categorie("Aliments", Icons.fastfood),
    Categorie("Voiture", Icons.car_crash),
    Categorie("Moto", Icons.motorcycle_rounded),
    Categorie("Moto", Icons.motorcycle_rounded),
  ];
  final List<String> _selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _filters.map((filter) {
                final isSelected = _selectedFilters.contains(filter);
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: FilterChip(
                    avatar: Icon(
                      filter.icon,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    backgroundColor: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(vertical: 0.2),
                    label: Text(filter.designation),
                    selected: isSelected,
                    onSelected: (selected) {},
                    selectedColor: Theme.of(context).colorScheme.onSurface,
                    checkmarkColor: Colors.blue,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ProductItemCard(
                product: products[index],
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
