import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasuke_ai/service/auth/firebase_auth_service.dart';

class SplashService {
  User _user;

  SplashService() {
    _user = FirebaseAuthService().getAuthenticatedUser();
  }

  User get user => _user;

  /*
   * スプラッシュ画面で1秒経過したら画面を遷移する
   */
  void setTimer({@required BuildContext context}) {
    Timer(const Duration(seconds: 1), () {
      if (user == null) {
        Navigator.of(context).pushNamedAndRemoveUntil('/welcome', ModalRoute.withName(''));
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil('/home', ModalRoute.withName(''));
      }
    });
  }
}
