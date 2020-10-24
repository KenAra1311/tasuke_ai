import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasuke_ai/factory/user_factory.dart';
import 'package:tasuke_ai/model/user/user.dart' as UserModel;
import 'package:tasuke_ai/repositories/firebase/firebase_user_repository.dart';
import 'package:tasuke_ai/service/auth/firebase_auth_service.dart';

class UserEditService {
  FirebaseUserRepository _firebaseUserRepository;
  User _user;

  UserEditService() {
    _firebaseUserRepository = FirebaseUserRepository();
    _user = FirebaseAuthService().getAuthenticatedUser();
  }

  Future<Map<String, dynamic>> getSelf() async {
    return await _firebaseUserRepository.getSelf(uid: _user.uid);
  }

  Future updateUser({
    @required String name,
    @required String oldEmail,
    @required String oldPassword,
    @required String email,
    @required String password
  }) async {
    try {
      await _user.reauthenticateWithCredential(EmailAuthProvider.credential(email: oldEmail, password: oldPassword))
        .then((_) {
          // auth関連のデータを変更
          _user.updateEmail(email);
          _user.updatePassword(password);

          // firestoreのデータを変更
          final UserModel.User _userModel = UserFactory(
            uid: _user.uid,
            name: name,
            email: email,
            password: password
          ).make();

          _firebaseUserRepository.update(user: _userModel, uid: _user.uid);
        });

      return '';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'requires-recent-login':
          return 'アカウント情報を変更するために変更前のメールアドレスを入力してください';
        case 'user-mismatch':
          return '入力いただいた現在のメールアドレスがアカウントのメールアドレスと違うようです';
        case 'wrong-password':
          return '入力いただいたパスワードが違うようです';
      }

      return e.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
