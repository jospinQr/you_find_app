import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:you_app/domain/model/CartItem.dart';
import 'package:you_app/ui/component/CartItem.dart';
import 'package:you_app/ui/view_model/HomeViewModel.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viemoddel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled:
                true, // Très important pour la gestion du clavier
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context)
                        .viewInsets
                        .bottom), // Gestion du clavier
                child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height *
                        0.2, // 60% de la hauteur de l'écran
                    child: const Column(
                      children: [Text("Jospo")],
                    ) // Votre contenu
                    ),
              );
            },
          );
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: const Icon(Icons.visibility),
      ),
      body: viemoddel.cartItem.isNotEmpty
          ? ListView.separated(
              itemCount: viemoddel.cartItem.length,
              itemBuilder: (BuildContext context, int index) {
                return CartItemCard(
                  cartItem: viemoddel.cartItem[index],
                  qt: viemoddel.cartItem[index].qt,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SlideInDown(
                      child: Text(
                    "Votre pagné est vide",
                    style: GoogleFonts.eater(),
                  )),
                  SlideInUp(child: const Icon(Icons.delete_outline_outlined))
                ],
              ),
            ),
    );
  }
}
