import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/home/home_service.dart';

class HomePageModelView extends ChangeNotifier {
  HomeService _homeService;

  HomePageModelView() {
    _homeService = HomeService();
  }

  /*
   * 認証済みのユーザを取得する
   */
  User getAuthenticatedUser() {
    return _homeService.getAuthenticatedUser();
  }
}
