import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/setting/user_delete/user_delete_service.dart';
import 'package:tasuke_ai/service/validator/auth_validator.dart';

class UserDeletePageModelView extends ChangeNotifier {
  UserDeleteService _userDeleteService;
  AuthValidator _authValidator;
  TextEditingController _passwordTextController;
  bool _passwordValidate;
  bool _visible;
  String _info;

  UserDeletePageModelView() {
    _userDeleteService = UserDeleteService();
    _authValidator = AuthValidator();
    _passwordTextController = TextEditingController();
    _passwordValidate = false;
    _visible = false;
    _info = '';
  }

  TextEditingController get passwordTextController => _passwordTextController;
  bool get passwordValidate => _passwordValidate;
  bool get visible => _visible;
  String get info => _info;

  Future deleteUser({@required BuildContext context}) async {
    // 入力レベルのバリデーションチェック
    _passwordValidate = _authValidator.passwordValidator(password: passwordTextController.text);
    if (passwordValidate) {
      notifyListeners();
      return;
    }

    _visible = true;
    notifyListeners();
    
    _info = await _userDeleteService.deleteUser(
      context: context,
      password: passwordTextController.text,
    );

    if (info != '') {
      notifyListeners();
    }

    _visible = false;
  }
}
