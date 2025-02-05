import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:you_app/ui/screen/MainScreen.dart';
import 'package:you_app/ui/screen/login/SignInScreen.dart';
import 'package:you_app/ui/screen/login/SignUpScreen.dart';

import '../../utils/StaticFunction.dart';
import '../component/CustomerButton.dart';

class Authscreen extends StatelessWidget {
  const Authscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SlideInDown(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.left,
                  "Connectez-vous pour accéder à toutes vos fonctionnalités personnalisées "
                  "et profiter d'une expérience optimale.Veuillez entrer vos identifiants "
                  "pour continuer. Si vous n'avez pas encore de compte, inscrivez-vous en"
                  " quelques étapes simples !",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                ),
              ),
              SlideInDown(child: const Icon(Icons.shopping_bag, size: 32)),
              const Icon(Icons.shopping_cart, size: 78),
              Expanded(
                child: Column(
                  children: [
                    CustomerButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignInScreen()));
                      },
                      text: "Se connecter",
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      borderColor: Theme.of(context).colorScheme.onSurface,
                      textColor: Theme.of(context).colorScheme.surface,
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      "Utilise ton compte pour te connecter",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 12.0),
                    CustomerButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpScreen(),
                          ),
                        );
                      },
                      text: "S'inscrire",
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      borderColor: Theme.of(context).colorScheme.onSurface,
                      textColor: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      "En t'inscrivant tu acceptes nos conditions d'utilisation",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 12.0),
                    TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white24),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      child: const Text(
                        "Continuer sans mes données ?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
