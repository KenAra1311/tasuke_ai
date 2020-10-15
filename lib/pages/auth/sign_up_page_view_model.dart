import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/auth/sign_up_service.dart';

class SignUpPageModelView extends ChangeNotifier {
  SignUpService _signUpService;
  TextEditingController _nameTextController;
  TextEditingController _emailTextController;
  TextEditingController _passwordTextController;
  bool _nameValidate;
  bool _emailValidate;
  bool _passwordValidate;

  SignUpPageModelView() {
    _signUpService = SignUpService();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameValidate = false;
    _emailValidate = false;
    _passwordValidate = false;
  }

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  bool get nameValidate => _nameValidate;
  bool get emailValidate => _emailValidate;
  bool get passwordValidate => _passwordValidate;

  /*
   * ユーザを登録して、成功ならば画面遷移、失敗ならばリダイレクト
   */
  Future signUpUser(context) async {
    // バリデーションチェック
    _nameValidate = _signUpService.nameValidator(name: nameTextController.text);
    _emailValidate = _signUpService.emailValidator(email: emailTextController.text);
    _passwordValidate = _signUpService.passwordValidator(password: passwordTextController.text);
    if (nameValidate || emailValidate || passwordValidate) {
      notifyListeners();
      return;
    }

    await _signUpService.signUpUser(
      name: nameTextController.text,
      email: emailTextController.text,
      password: passwordTextController.text,
      emailValidate: _emailValidate,
      passwordValidate: _passwordValidate,
      context: context
    );
  }
}
