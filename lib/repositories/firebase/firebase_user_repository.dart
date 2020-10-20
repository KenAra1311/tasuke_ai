import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasuke_ai/model/user/user_repository.dart';
import 'package:tasuke_ai/model/user/user.dart';

class FirebaseUserRepository implements UserRepository {
  CollectionReference _query;

  FirebaseUserRepository() {
    _query = FirebaseFirestore.instance.collection('users');
  }

  @override
  Future<Map<String, dynamic>> getSelf({@required String uid}) async {
    Map<String, dynamic> _user;
    await _query
      .doc(uid)
      .get()
        .then((value) => _user = value.data());

    return _user;
  }

  @override
  Future store({@required User user}) async {
    await _query
      .doc(user.uid.value.toString())
      .set(user.toMap());
  }

  @override
  Future update({
    @required User user,
    @required String uid
  }) async {
    await _query
      .doc(uid)
      .update(user.toMap());
  }

  @override
  Future delete({@required String uid}) async {
    await _query
      .doc(uid)
      .delete();
  }
}
