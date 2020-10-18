import 'package:flutter/cupertino.dart';

class Email {
  final _email;

  Email({@required String email}) : _email = email {
    if (email.isEmpty || email == null) {
      throw Exception('メールアドレスが入力されておりません');
    }

    final RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value)) {
      throw Exception('適切なメールアドレス形式ではありません。');
    }
  }

  String get value => _email;
}
