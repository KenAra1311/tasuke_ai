import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/auth/sign_up_service.dart';

class SignUpPageModelView extends ChangeNotifier {
  SignUpService _signUpService;
  TextEditingController _emailTextController;
  TextEditingController _passwordTextController;
  String _info;

  SignUpPageModelView() {
    _signUpService = SignUpService();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _info = '';
  }

  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  String get info => _info;

  /*
   * ユーザを登録して、成功ならば画面遷移、失敗ならばリダイレクト
   */
  Future signUpUser(context) async {
    await _signUpService.signUpUser(
      mail: emailTextController.text,
      password: passwordTextController.text,
      info: info,
      context: context
    );
  }
}
