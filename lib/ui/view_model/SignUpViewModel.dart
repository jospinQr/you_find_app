import 'dart:io';

import 'package:flutter/widgets.dart';

class SignUpViewModel with ChangeNotifier {
  // final UserRepository _userRepository;
  // final AuthRepository _authRepository;

  String _userName = "";
  String _email = "";
  String _password = "";
  String _passWordRep = "";
  String _telephone = "";
  String _type = "CLIENT";

  bool _isPassWordVisible = false;
  bool _isLoading = false;
  File? _selectedImage;

  //SignUpViewModel(this._userRepository, this._authRepository);

  String get userName => _userName;

  String get email => _email;

  String get password => _password;

  String get passwordRep => _passWordRep;

  bool get isLoading => _isLoading;

  File? get selectedImage => _selectedImage;

  bool get isPassWordVisible => _isPassWordVisible;

  String get telephone => _telephone;

  String get type => _type;

  void onUserNameChange(String value) {
    _userName = value;
  }

  void onEmailChange(String value) {
    _email = value;
  }

  void onPasswordChange(String value) {
    _password = value;
  }

  void onPassWordRepChange(String value) {
    _passWordRep = value;
  }

  void onPasswordRepChange(String value) {
    _passWordRep = value;
  }

  void onPassWordVisibilityChange() {
    _isPassWordVisible = !_isPassWordVisible;
  }

  void onTelephoneChange(String value) {
    _telephone = value;
  }

  Future<void> onSignUpClick(BuildContext context) async {
    // _isLoading = true;
    // notifyListeners();
    //
    // final name = _selectedImage?.path.split("/").last;
    //
    // //final creditials =
    // // await _authRepository.createUserWithEmail(_email, _password);
    // // final formData = FormData.fromMap({
    // //   'file':
    // //   await MultipartFile.fromFile(_selectedImage!.path, filename: name),
    // //   'user': jsonEncode({
    // //     'id': creditials?.uid,
    // //     'email': _email,
    // //     'name': _userName,
    // //     'imgUrl': imgUrl,
    // //     'telephone': _telephone,
    // //     'type': _type
    // //   })///  });
    // try {
    //   await _userRepository.addUser(formData);
    //
    //   Navigator.pushNamedAndRemoveUntil(
    //     context,
    //     "/userInfo",
    //         (Route<dynamic> route) => false,
    //   );
    //
    //   _isLoading = false;
    //   notifyListeners();
    // } on FirebaseException catch (e) {
    //   if (context.mounted) {
    //     StaticFunctions.showErrorSnackBar(context, e.toString());
    //     Navigator.of(context, rootNavigator: true).pop();
    //   }
    // } on DioException catch (e) {
    //   if (context.mounted) {
    //     StaticFunctions.showErrorSnackBar(context, e.toString());
    //     Navigator.of(context, rootNavigator: true).pop();
    //   }
    // } catch (e) {
    //   if (context.mounted) {
    //     StaticFunctions.showErrorSnackBar(context, e.toString());
    //     Navigator.of(context, rootNavigator: true).pop();
    //   }
    // } finally {
    //   _isLoading = false;
    //   notifyListeners();
    // }
  }

  Future<void> pickImage() async {
    //   final picker = ImagePicker();
    //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //
    //   if (pickedFile != null) {
    //     _selectedImage = File(pickedFile.path);
    //     notifyListeners();
    //   }
    // }
    //
    void removeFile() {
      _selectedImage = null;
      notifyListeners();
    }
  }
}
