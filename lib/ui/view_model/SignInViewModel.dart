import 'package:flutter/cupertino.dart';
import 'package:you_app/ui/screen/login/SignInScreen.dart';

class SignInViewModel with ChangeNotifier {
  //final AuthRepository _authRepository;

  String _userName = "";
  String _passWord = "";
  bool _isPassWordVisible = true;
  bool _isLoading = false;

  //constructeur

  // SignInViewModel(this._authRepository);

  String get userName => _userName;

  String get passWord => _passWord;

  bool get isLoading => _isLoading;

  bool get isPassWordVisible => _isPassWordVisible;

  void onUserMailChange(String newValue) {
    _userName = newValue;
    notifyListeners();
  }

  void onPasswordChange(String newValue) {
    _passWord = newValue;
    notifyListeners();
  }

  void onPassWordVisibility() {
    _isPassWordVisible = !_isPassWordVisible;
    notifyListeners();
  }

  Future<void> onLoginClick(BuildContext context) async {
    // _isLoading = true;
    // notifyListeners();
    // try {
    //   await _authRepository.signinWithEmailAndPassWord(_userName, _passWord);
    //   if (context.mounted) {
    //     if (userName == "joekahereni@gmail.com") {
    //       Navigator.pushReplacementNamed(context, "/dashboard");
    //     } else {
    //       Navigator.pushReplacementNamed(context, "/home");
    //     }
    //   }
    // } on FirebaseAuthException catch (e) {
    //   String errorMessage;
    //   if (e.code == "invalid-credential") {
    //     errorMessage = "Email ou mot de passe incorrect";
    //   } else {
    //     errorMessage =
    //     "Une erreur inattendue est survenu. Verifiez votre connexion internet";
    //   }
    //   if (context.mounted) {
    //     StaticFunctions.showErrorSnackBar(context, errorMessage);
    //     Navigator.of(context, rootNavigator: true).pop();
    //   }
    // } finally {
    //   _isLoading = false;
    //   notifyListeners();
    // }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    // _isLoading = true;
    // notifyListeners();
    // try {
    //   UserCredential? userCredential = await _authRepository.signInWithGoogle();
    //   if (userCredential != null) {
    //     if (context.mounted) {
    //       if (userCredential.user!.email == "joekahereni@gmail.com") {
    //         Navigator.pushReplacementNamed(context, "/dashboard");
    //       } else {
    //         Navigator.pushReplacementNamed(context, "/home");
    //       }
    //     }
    //   } else {
    //     if (context.mounted) {
    //       _isLoading = false;
    //       notifyListeners();
    //       StaticFunctions.showErrorSnackBar(
    //           context, "Erreur lors de la connexion avec Google.");
    //     }
    //   }
    // } catch (e) {
    //   print(e.toString());
    //   if (context.mounted) {
    //     StaticFunctions.showErrorSnackBar(
    //         context, "Une erreur inattendue est survenue.");
    //   }
    // } finally {
    //   _isLoading = false;
    //   notifyListeners();
    // }
  }
}
