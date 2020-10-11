import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/splash/splash_service.dart';

class SplashPageModelView {
  SplashService _splashService;

  SplashPageModelView() {
    _splashService = SplashService();
  }

  /*
   * スプラッシュ画面で1秒経過したら画面を遷移する
   */
  void setTimer(BuildContext context) {
    _splashService.setTimer(context);
  }
}
