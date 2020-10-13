import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpService {
  /*
   * ユーザを登録して、成功ならば画面遷移、失敗ならばリダイレクト
   */
  Future<dynamic> signUpUser({
    @required String email,
    @required String password,
    @required String info,
    @required BuildContext context
  }) async {
    final String errorStatement = checkValidation(email: email, password: password);
    if (errorStatement != '') {
      info = errorStatement;

      return;
    }

    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      Navigator.of(context).pushNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        info = '入力していただいたパスワードが脆弱のようです。';
      } else if (e.code == 'email-already-in-use') {
        info = '入力していただいたメールアドレスはすでに存在しております。';
      }
    } catch (e) {
      info = e.toString();
    }
  }

  /*
   * 入力された項目のバリデーションチェック
   */
  String checkValidation({
    @required String email,
    @required String password
  }) {
    String errorStatement = '';

    if (email == '') {
      errorStatement += 'メールアドレスが入力されておりません\n';
    }
    if (!email.contains('@')) {
      errorStatement += 'メールアドレスが形式が正しくありません\n';
    }
    if (password == '') {
      errorStatement += 'パスワードが入力されておりません\n';
    }

    return errorStatement;
  }
}
