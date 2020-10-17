import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasuke_ai/model/user/user_repository.dart';
import 'package:tasuke_ai/model/user/user.dart' as UserModel;

class FirebaseUserRepository implements UserRepository {
  FirebaseAuth _auth;
  CollectionReference _query;

  FirebaseUserRepository() {
    _auth = FirebaseAuth.instance;
    _query = FirebaseFirestore.instance.collection('users');
  }

  User getAuthenticatedUser() {
    return _auth.currentUser;
  }

  @override
  Future store({@required UserModel.User user}) async {
    await _query
      .doc(user.uid.value.toString())
      .set(user.toMap());
  }

  void signOutUser({@required BuildContext context}) {
    _auth.signOut()
      .then((_) => Navigator.of(context).pushReplacementNamed('/welcome'));
  }
}
