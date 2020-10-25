import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasuke_ai/repositories/firebase/firebase_user_repository.dart';
import 'package:tasuke_ai/service/auth/firebase_auth_service.dart';

class UserDeleteService {
  FirebaseUserRepository _firebaseUserRepository;
  User _user;

  UserDeleteService() {
    _firebaseUserRepository = FirebaseUserRepository();
    _user = FirebaseAuthService().getAuthenticatedUser();
  }

  /*
   * ユーザを削除する
   */
  Future deleteUser({
    @required BuildContext context,
    @required String password,
  }) async {
    try {
      await _user.reauthenticateWithCredential(EmailAuthProvider.credential(email: _user.email, password: password))
        .then((_) {
          // firestoreのデータを削除
          _firebaseUserRepository.delete(uid: _user.uid)
            .then((_) {
              // firebaseAuthのデータを削除
              _user.delete()
                .then((_) {
                  Navigator.of(context).pushNamedAndRemoveUntil('/welcome', ModalRoute.withName('/'));
                });
            });
        });

      return '';
    } on FirebaseAuthException catch (e) {
      print(e);

      switch (e.code) {
        case 'wrong-password':
          return '入力いただいたパスワードが違うようです';
      }

      return e.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
