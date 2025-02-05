import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../component/CustomerButton.dart';
import '../view_model/WelcomViewModel.dart';
import 'AuthScreen.dart';

class Welcomscreen extends StatelessWidget {
  const Welcomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WelcomViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: viewModel.pageviewController,
                onPageChanged: (int index) {
                  viewModel.changePage(index);
                },
                children: [
                  SlideInDown(child: FirstPage(context, viewModel)),
                  SlideInUp(child: SecondPage(context, viewModel)),
                  SlideInDown(child: ThirdPage(context, viewModel))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: SmoothPageIndicator(
                controller: viewModel.pageviewController,
                count: 3,
                effect: JumpingDotEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    jumpScale: .7,
                    verticalOffset: 15,
                    activeDotColor: Theme.of(context).colorScheme.onSurface,
                    dotColor: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget FirstPage(BuildContext context, WelcomViewModel viewModel) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "YouFind",
            style: GoogleFonts.rubikWetPaint(fontSize: 42),
          ),
          SlideInDown(child: const Icon(Icons.shopping_bag, size: 32)),
          const Icon(Icons.shopping_cart, size: 78),
          const SizedBox(height: 14.0),
          const Text(
            "Commandez facilement vos plats préférés et savourez un moment gourmand où que vous soyez dans la ville de Butembo !",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32.0),
          CustomerButton(
            textColor: Theme.of(context).colorScheme.surface,
            borderColor: Theme.of(context).colorScheme.onSurface,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            onTap: () {
              viewModel.nextPage();
            },
            text: "Suivant",
          )
        ],
      ),
    ),
  );
}

Widget SecondPage(BuildContext context, WelcomViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        const Text(
          "Livraison rapide",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36.0),
        ),
        SlideInLeft(
          child: const Icon(
            Icons.delivery_dining_rounded,
            size: 92,
          ),
        ),
        const SizedBox(
          height: 14.0,
        ),
        const Text(
          "Nous garantissons une livraison rapide et ponctuelle pour que vos repas arrivent toujours chauds et prêts à être dégustés !",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomerButton(
                textColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                onTap: () {
                  viewModel.previousPage();
                },
                text: "Precedent ",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomerButton(
                textColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                onTap: () {
                  viewModel.nextPage();
                },
                text: " Suivant",
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget ThirdPage(BuildContext context, WelcomViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        const Text(
          "Commençons",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36.0),
        ),
        Spin(
          child: const Icon(
            Icons.shopping_bag_rounded,
            size: 98,
          ),
        ),
        const SizedBox(
          height: 14.0,
        ),
        const Text(
          "Découvrez nos fonctionnalités : explorez le menu, passez votre commande en quelques clics et suivez votre livraison en temps réel !",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomerButton(
                textColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                onTap: () {
                  viewModel.previousPage();
                },
                text: "Precedent ",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomerButton(
                textColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Authscreen()),
                  );
                },
                text: "Commencer",
              ),
            ),
          ],
        )
      ],
    ),
  );
}
