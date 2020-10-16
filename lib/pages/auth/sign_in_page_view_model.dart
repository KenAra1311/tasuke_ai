import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/auth/sign_in_service.dart';
import 'package:tasuke_ai/service/validator/auth_validator.dart';

class SignInPageModelView extends ChangeNotifier {
  SignInService _signInService;
  AuthValidator _authValidator;
  TextEditingController _emailTextController;
  TextEditingController _passwordTextController;
  bool _emailValidate;
  bool _passwordValidate;
  String _info;

  SignInPageModelView() {
    _signInService = SignInService();
    _authValidator = AuthValidator();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _emailValidate = false;
    _passwordValidate = false;
    _info = '';
  }

  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  bool get emailValidate => _emailValidate;
  bool get passwordValidate => _passwordValidate;
  String get info => _info;

  /*
   * サインインを実行し、成功ならば画面遷移
   */
  Future signInUser({@required BuildContext context}) async {
    // 入力レベルのバリデーションチェック
    _emailValidate = _authValidator.emailValidator(email: emailTextController.text);
    _passwordValidate = _authValidator.passwordValidator(password: passwordTextController.text);
    if (emailValidate || passwordValidate) {
      notifyListeners();
      return;
    }

    _info = await _signInService.signInUser(
      email: emailTextController.text,
      password: passwordTextController.text,
      context: context,
    );

    if (info != '') {
      notifyListeners();
    }
  }
}
