import 'package:flutter/cupertino.dart';

class Password {
  final _password;
  final _min = 6;

  Password({@required String password}) : _password = password {
    if (password.isEmpty || password == null) {
      throw Exception('パスワードが入力されておりません');
    }
    if (_min > _password.length) {
      throw Exception('パスワードは6文字以上で入力してください');
    }
  }

  String get value => _password;
}
