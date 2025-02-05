import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../utils/StaticFunction.dart';
import '../../component/CustomerButton.dart';
import '../../component/CustomerTextField.dart';
import '../../view_model/SignUpViewModel.dart';

var login_form_key = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          title: const Text(
            "Inscription",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: Consumer<SignUpViewModel>(builder: (context, viewModel, child) {
          // if (viewModel?.isLoading) {
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     StaticFunctions.showLoadingDialog(
          //         context, "Inscription encours...");
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
                        child: viewModel.selectedImage == null
                            ? InkWell(
                                onTap: viewModel.pickImage,
                                child: Icon(
                                  Icons.add_reaction_sharp,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  size: 68,
                                ))
                            : InkWell(
                                onTap: () {
                                  viewModel.pickImage();
                                },
                                child: Stack(children: [
                                  ClipOval(
                                    child: Image.file(
                                      viewModel.selectedImage!,
                                      fit: BoxFit.cover,
                                      width: 160,
                                      height: 160,
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    child: IconButton(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      onPressed: () {
                                        // viewModel.removeFile();
                                      },
                                      icon: const Icon(Icons.minimize),
                                    ),
                                  ),
                                ]),
                              ),
                      ),
                      const SizedBox(height: 16.0),
                      Customertextfield(
                        label: "Nom complet",
                        onTextChanged: (newValue) {
                          viewModel.onUserNameChange(newValue);
                        },
                        prefixIcon: Icons.person,
                        validator: (value) {
                          if (value!.length < 3) {
                            return "Le nom doit avoir au moins 3 lettres";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      Customertextfield(
                        label: "E-mail",
                        onTextChanged: (newValue) {
                          viewModel.onEmailChange(newValue);
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
                          viewModel.onPassWordVisibilityChange();
                        },
                        validator: (vale) {
                          if (vale!.length < 6) {
                            return "Mot de passe trop court";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      Customertextfield(
                        isObscure: viewModel.isPassWordVisible,
                        label: 'Repeter le mot de passe',
                        prefixIcon: Icons.security,
                        sufixIcon: viewModel.isPassWordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTextChanged: (value) {
                          viewModel.onPassWordRepChange(value);
                        },
                        onSufficIconClick: () {
                          viewModel.onPassWordVisibilityChange();
                        },
                        validator: (vale) {
                          if (viewModel.password != viewModel.passwordRep) {
                            return "Les mots de passse doivent correspondre";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 36),
                      CustomerButton(
                        onTap: () {
                          if (login_form_key.currentState!.validate()) {
                            viewModel.onSignUpClick(context);
                          }
                        },
                        text: "S'inscrire",
                        textColor: Theme.of(context).colorScheme.surface,
                        backgroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        borderColor: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(height: 23.0),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
