import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasuke_ai/factory/post_help_factory.dart';
import 'package:tasuke_ai/model/post_help/post_help.dart';
import 'package:tasuke_ai/repositories/firebase/firebase_post_help_repository.dart';
import 'package:tasuke_ai/service/auth/firebase_auth_service.dart';

class PostHelpService {
  User _user;
  FirebasePostHelpRepository _firebasePostHelpRepository;

  PostHelpService() {
    _user = FirebaseAuthService().getAuthenticatedUser();
    _firebasePostHelpRepository = FirebasePostHelpRepository();
  }

  /*
   * 投稿を実行し、OKならば保存＆リダイレクトを行う
   */
  Future postHelp({
    @required BuildContext context,
    @required String title,
    String description,
    @required String date,
    @required String time,
    @required String duration,
    @required String createdAt,
  }) async {
    try {
      final PostHelp _postHelp = PostHelpFactory(
        uid: _user.uid,
        title: title,
        description: description,
        dateTime: date + time,
        duration: duration,
        createdAt: createdAt,
      ).make();

      await _firebasePostHelpRepository.store(postHelp: _postHelp)
        .then((_) => Navigator.of(context).pushNamedAndRemoveUntil('/home', ModalRoute.withName('')));

      return '';
    } catch (e) {
      return e.toString();
    }
  }
}
