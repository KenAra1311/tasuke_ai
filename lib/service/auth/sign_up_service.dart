import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasuke_ai/factory/user_factory.dart';
import 'package:tasuke_ai/model/user/user.dart' as UserModel;
import 'package:tasuke_ai/repositories/firebase/firebase_user_repository.dart';

class SignUpService {
  /*
   * サインアップを実行し、成功ならば画面遷移
   */
  Future signUpUser({
    @required String name,
    @required String email,
    @required String password,
    @required BuildContext context
  }) async {
    try {
      await Firebase.initializeApp();
      final User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;

      if (user != null) {
        final UserModel.User userModel = UserFactory(
          uid: user.uid,
          name: name,
          email: email,
          password: password
        ).make();

        FirebaseUserRepository().store(user: userModel)
          .then((value) => Navigator.of(context).pushReplacementNamed('/home'));

        return '';
      }
    } on FirebaseAuthException catch (e) {
      print(e);

      switch (e.code) {
        case 'email-already-in-use':
          return '入力いただいたメールアドレスは、既に別のアカウントで使用されています';
      }

      return e.code.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
