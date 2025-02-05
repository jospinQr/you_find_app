import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_app/ui/screen/SplashScreen.dart';
import 'package:you_app/ui/view_model/HomeViewModel.dart';
import 'package:you_app/ui/view_model/SignInViewModel.dart';
import 'package:you_app/ui/view_model/SignUpViewModel.dart';
import 'package:you_app/ui/view_model/WelcomViewModel.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => WelcomViewModel()),
      ChangeNotifierProvider(create: (_) => SignUpViewModel()),
      ChangeNotifierProvider(create: (_) => SignInViewModel()),
      ChangeNotifierProvider(create: (_) => HomeViewModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouFind',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            surface: Colors.white,
            tertiary: Colors.black.withOpacity(0.5)),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}
