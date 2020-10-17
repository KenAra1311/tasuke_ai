import 'package:firebase_auth/firebase_auth.dart';

class HomeService {
  /*
   * 認証済みのユーザを取得する
   */
  User getAuthenticatedUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
