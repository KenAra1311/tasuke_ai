import 'package:flutter/cupertino.dart';

class AuthValidator {
  /*
   * アカウント名のバリデーション
   */
  bool nameValidator({@required String name}) {
    return name.isEmpty ? true : false;
  }

  /*
   * メールアドレスのバリデーション
   */
  bool emailValidator({@required String email}) {
    if (email.isEmpty || !email.contains('@')) {
      return true;
    }
    return false;
  }

  /*
   * パスワードのバリデーション
   */
  bool passwordValidator({@required String password}) {
    if (password.isEmpty || password.length < 6) {
      return true;
    }
    return false;
  }
}
