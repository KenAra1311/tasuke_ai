import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasuke_ai/model/user/user_repository.dart';
import 'package:tasuke_ai/model/user/user.dart' as UserModel;

class FirebaseUserRepository implements UserRepository {
  CollectionReference _query;

  FirebaseUserRepository() {
    _query = FirebaseFirestore.instance.collection('users');
  }

  @override
  Future store({@required UserModel.User user}) async {
    await _query
      .doc(user.uid.value.toString())
      .set(user.toMap());
  }
}
