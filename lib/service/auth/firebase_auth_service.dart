import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  FirebaseAuth _auth;

  FirebaseAuthService() {
    _auth = FirebaseAuth.instance;
  }

  /*
   * 認証済みのユーザを取得する
   */
  User getAuthenticatedUser() {
    return _auth.currentUser;
  }

  /*
   * サインアウトを実行する
   */
  void signOutUser({@required BuildContext context}) {
    _auth.signOut()
      .then((_) => Navigator.of(context).pushNamedAndRemoveUntil('/welcome', ModalRoute.withName('/')));
  }
}
