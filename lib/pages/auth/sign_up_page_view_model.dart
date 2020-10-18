import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/auth/sign_up_service.dart';
import 'package:tasuke_ai/service/validator/auth_validator.dart';

class SignUpPageModelView extends ChangeNotifier {
  SignUpService _signUpService;
  AuthValidator _authValidator;
  TextEditingController _nameTextController;
  TextEditingController _emailTextController;
  TextEditingController _passwordTextController;
  bool _nameValidate;
  bool _emailValidate;
  bool _passwordValidate;
  bool _visible;
  String _info;

  SignUpPageModelView() {
    _signUpService = SignUpService();
    _authValidator = AuthValidator();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameValidate = false;
    _emailValidate = false;
    _visible = false;
    _passwordValidate = false;
    _info = '';
  }

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  bool get nameValidate => _nameValidate;
  bool get emailValidate => _emailValidate;
  bool get passwordValidate => _passwordValidate;
  bool get visible => _visible;
  String get info => _info;

  /*
   * サインアップを実行し、成功ならば画面遷移
   */
  Future signUpUser({@required BuildContext context}) async {
    // 入力レベルのバリデーションチェック
    _nameValidate = _authValidator.nameValidator(name: nameTextController.text);
    _emailValidate = _authValidator.emailValidator(email: emailTextController.text);
    _passwordValidate = _authValidator.passwordValidator(password: passwordTextController.text);
    if (nameValidate || emailValidate || passwordValidate) {
      notifyListeners();
      return;
    }

    _visible = true;
    notifyListeners();

    _info = await _signUpService.signUpUser(
      name: nameTextController.text,
      email: emailTextController.text,
      password: passwordTextController.text,
      context: context
    );

    if (info != '') {
      _visible = false;
      notifyListeners();
    }
  }
}
