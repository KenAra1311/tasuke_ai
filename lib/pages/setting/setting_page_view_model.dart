import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/auth/firebase_auth_service.dart';

class SettingPageModelView extends ChangeNotifier {
  FirebaseAuthService _firebaseAuthService;

  SettingPageModelView() {
    _firebaseAuthService = FirebaseAuthService();
  }

  /*
   * サインアウトを実行する
   */
  void signOutUser({@required BuildContext context}) {
    return _firebaseAuthService.signOutUser(context: context);
  }
}
