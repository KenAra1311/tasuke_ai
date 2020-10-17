import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasuke_ai/repositories/firebase/firebase_user_repository.dart';

class SettingService {
  FirebaseUserRepository _firebaseUserRepository;

  SettingService() {
    _firebaseUserRepository = FirebaseUserRepository();
  }

  /*
   * 認証済みのユーザを取得する
   */
  User getAuthenticatedUser() {
    return _firebaseUserRepository.getAuthenticatedUser();
  }
}
