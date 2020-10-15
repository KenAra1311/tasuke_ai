import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasuke_ai/factory/user_factory.dart';
import 'package:tasuke_ai/model/user/user.dart' as UserModel;
import 'package:tasuke_ai/repositories/firebase/firebase_user_repository.dart';

class SignUpService {
  /*
   * ユーザを登録して、成功ならば画面遷移、失敗ならばリダイレクト
   */
  Future signUpUser({
    @required String name,
    @required String email,
    @required String password,
    @required bool emailValidate,
    @required bool passwordValidate,
    @required BuildContext context
  }) async {
    try {
      await Firebase.initializeApp();
      final User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;

      if (user != null) {
        final UserModel.User userModel = UserFactory(
          uid: user.uid,
          name: name,
          email: email
        ).make();
        FirebaseUserRepository().store(user: userModel);

        Navigator.of(context).pushNamed('/home');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'missing-email':
        case 'invalid-email':
        case 'email-already-in-use':
          emailValidate = true;
          break;
        case 'weak-password':
          passwordValidate = true;
          break;
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
