import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../utils/StaticFunction.dart';
import '../../component/CustomerButton.dart';
import '../../component/CustomerTextField.dart';
import '../../view_model/SignInViewModel.dart';

var login_form_key = GlobalKey<FormState>();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Connexion",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: Consumer<SignInViewModel>(builder: (context, viewModel, child) {
          // if (viewModel.isLoading) {
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     StaticFunctions.showLoadingDialog(
          //         context, "Connexion encours...");
          //   });
          // }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Form(
                  key: login_form_key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BounceInDown(
                        child: Icon(
                          Icons.person_outline_rounded,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 68,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Customertextfield(
                        label: "E-mail",
                        onTextChanged: (newValue) {
                          viewModel.onUserMailChange(newValue);
                        },
                        prefixIcon: Icons.alternate_email_sharp,
                        validator: (value) {
                          if (!StaticFunctions.isValidEmail(value!)) {
                            return "Entrer un email valide";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      Customertextfield(
                        isObscure: viewModel.isPassWordVisible,
                        label: 'Mot de passe',
                        prefixIcon: Icons.security,
                        sufixIcon: viewModel.isPassWordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTextChanged: (value) {
                          viewModel.onPasswordChange(value);
                        },
                        onSufficIconClick: () {
                          viewModel.onPassWordVisibility();
                        },
                        validator: (vale) {
                          if (vale!.length < 6) {
                            return "Mot de passe trop court";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 36),
                      CustomerButton(
                        onTap: () {
                          if (login_form_key.currentState!.validate()) {
                            viewModel.onLoginClick(context);
                          }
                        },
                        text: "Connexion",
                        textColor: Theme.of(context).colorScheme.surface,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        borderColor: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 23.0),
                      CustomerButton(
                        onTap: () {
                          viewModel.signInWithGoogle(context);
                        },
                        text: "Continuer avec Google",
                        textColor: Theme.of(context).colorScheme.onSurface,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        borderColor: Theme.of(context).colorScheme.onSurface,
                        imageName: "images/googleicon.png",
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
