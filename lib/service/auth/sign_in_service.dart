import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInService {
  /*
   * サインインを実行し、成功ならば画面遷移
   */
  Future signInUser({
    @required String email,
    @required String password,
    @required BuildContext context,
  }) async {
    try {
      final user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;

      if (user != null) {
        Navigator.of(context).pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'));
      }

      return '';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return '入力いただいたメールアドレスが見つかりませんでした';
        case 'wrong-password':
          return '入力いただいたパスワードが違うようです';
      }

      return e.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
