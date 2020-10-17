import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/setting/setting_service.dart';

class SettingPageModelView extends ChangeNotifier {
  SettingService _settingService;

  SettingPageModelView() {
    _settingService = SettingService();
  }

  /*
   * 認証済みのユーザを取得する
   */
  User getAuthenticatedUser() {
    return _settingService.getAuthenticatedUser();
  }
}
