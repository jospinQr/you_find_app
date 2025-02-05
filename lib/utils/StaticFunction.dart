import 'package:flutter/material.dart';

class StaticFunctions {
  static bool isValidEmail(String email) {
    // Expression régulière pour valider un e-mail
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static void PushAndReplacePageRouter(
      BuildContext context, Widget destinationPage) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) =>
              destinationPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin =
                Offset(1.0, 0.0); // Start the animation from right to left
            const end = Offset.zero; // End at zero offset (initial position)
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ));
  }

  static void pushPageRouter(BuildContext context, Widget destinationPage) {
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) =>
              destinationPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin =
                Offset(1.0, 0.0); // Start the animation from right to left
            const end = Offset.zero; // End at zero offset (initial position)
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ));
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
        content: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  static void showSuccesSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Future<void> showLoadingDialog(
      BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // l'utilisateur doit appuyer sur un bouton pour fermer le dialog
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
              child: Center(
            child: Row(
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 20),
                Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                )
              ],
            ),
          )),
        );
      },
    );
  }

  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'L\'adresse e-mail n\'est pas valide.';
      case 'user-disabled':
        return 'Cet utilisateur a été désactivé.';
      case 'user-not-found':
        return 'Aucun utilisateur trouvé pour cet email.';
      case 'wrong-password':
        return 'Le mot de passe est incorrect.';
      case 'email-already-in-use':
        return 'Cet utilisateur existe est déjà.';
      case 'operation-not-allowed':
        return 'L\'opération n\'est pas autorisée.';
      case 'weak-password':
        return 'Le mot de passe est trop faible.';
      default:
        return 'Une erreur est survenue. Veuillez réessayer.';
    }
  }
}
