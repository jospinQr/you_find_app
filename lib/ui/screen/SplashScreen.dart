import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/StaticFunction.dart';
import 'WelcomScreen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 5000), () {
      if (context.mounted) {
        StaticFunctions.PushAndReplacePageRouter(context, const Welcomscreen());
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bienvenu sur",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "YouFind",
              style: GoogleFonts.rubikWetPaint(fontSize: 42),
            ),
            Lottie.asset(
              width: 200.0,
              height: 200.0,
              "animation/logo.json",
            ),
          ],
        ),
      ),
    );
  }
}
