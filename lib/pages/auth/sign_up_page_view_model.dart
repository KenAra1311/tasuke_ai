import 'package:flutter/cupertino.dart';
// import 'package:tasuke_ai/service/auth/sign_up_service.dart';

class SignUpPageModelView extends ChangeNotifier {
  // SignUpService _signUpService;
  TextEditingController _emailTextController;
  TextEditingController _passwordTextController;
  TextEditingController _passwordConfirmTextController;
  String _info;

  SignUpPageModelView() {
    // _signUpService = SignUpService();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _passwordConfirmTextController = TextEditingController();
    _info = '';
  }

  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get passwordConfirmTextController => _passwordConfirmTextController;
  String get info => _info;

  /*
   * ユーザを登録する
   */
  // Future<dynamic> signUpUser() async {
  //   await _signUpService.signUpUser(
  //     mail: emailTextController.text,
  //     password: passwordTextController.text,
  //     info: info
  //   );
  // }
}
