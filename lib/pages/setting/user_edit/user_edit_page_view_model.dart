import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/setting/user_edit/user_edit_service.dart';
import 'package:tasuke_ai/service/validator/auth_validator.dart';

class UserEditPageModelView extends ChangeNotifier {
  UserEditService _userEditService;
  AuthValidator _authValidator;
  TextEditingController _nameTextController;
  TextEditingController _oldEmailTextController;
  TextEditingController _oldPasswordTextController;
  TextEditingController _emailTextController;
  TextEditingController _passwordTextController;
  bool _nameValidate;
  bool _oldEmailValidate;
  bool _oldPasswordValidate;
  bool _emailValidate;
  bool _passwordValidate;
  bool _visible;
  String _info;

  UserEditPageModelView() {
    _userEditService = UserEditService();
    _authValidator = AuthValidator();
    _nameTextController = TextEditingController();
    _oldEmailTextController = TextEditingController();
    _oldPasswordTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _userEditService.getSelf().then((value) {
      _nameTextController.text = value['name'];
      _oldEmailTextController.text = value['email'];
    });

    _nameValidate = false;
    _oldEmailValidate = false;
    _oldPasswordValidate = false;
    _emailValidate = false;
    _passwordValidate = false;
    _visible = false;
    _info = '';
  }

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get oldEmailTextController => _oldEmailTextController;
  TextEditingController get oldPasswordTextController => _oldPasswordTextController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  bool get nameValidate => _nameValidate;
  bool get oldEmailValidate => _oldEmailValidate;
  bool get oldPasswordValidate => _oldPasswordValidate;
  bool get emailValidate => _emailValidate;
  bool get passwordValidate => _passwordValidate;
  bool get visible => _visible;
  String get info => _info;

  Future updateUser() async {
    // 入力レベルのバリデーションチェック
    _nameValidate = _authValidator.nameValidator(name: nameTextController.text);
    _oldEmailValidate = _authValidator.emailValidator(email: oldEmailTextController.text);
    _oldPasswordValidate = _authValidator.passwordValidator(password: oldPasswordTextController.text);
    _emailValidate = _authValidator.emailValidator(email: emailTextController.text);
    _passwordValidate = _authValidator.passwordValidator(password: passwordTextController.text);
    if (nameValidate || oldEmailValidate || oldPasswordValidate ||  emailValidate || passwordValidate) {
      notifyListeners();
      return;
    }

    _visible = true;
    notifyListeners();

    _info = await _userEditService.updateUser(
      name: nameTextController.text,
      oldEmail: oldEmailTextController.text,
      oldPassword: oldPasswordTextController.text,
      email: emailTextController.text,
      password: passwordTextController.text
    );

    if (info == '') {
      oldEmailTextController.text = emailTextController.text;
      oldPasswordTextController.text = '';
      emailTextController.text = '';
      passwordTextController.text = '';
    }

    _visible = false;
    notifyListeners();
  }
}
