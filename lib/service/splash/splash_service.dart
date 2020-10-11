import 'dart:async';

import 'package:flutter/material.dart';

class SplashService {
  /*
   * スプラッシュ画面で1秒経過したら画面を遷移する
   */
  void setTimer({@required BuildContext context}) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }
}
