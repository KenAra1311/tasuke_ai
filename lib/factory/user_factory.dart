import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/model/user/user.dart';
import 'package:tasuke_ai/model/user/valueobject/uid.dart';
import 'package:tasuke_ai/model/user/valueobject/name.dart';
import 'package:tasuke_ai/model/user/valueobject/email.dart';

class UserFactory {
  final String _uid;
  final String _name;
  final String _email;

  UserFactory({
    @required String uid,
    @required String name,
    @required String email,
  })  : _uid = uid,
        _name = name,
        _email = email;

  User make() {
    return User(
      uid: Uid(uid: _uid),
      name: Name(name: _name),
      email: Email(email: _email),
    );
  }
}
