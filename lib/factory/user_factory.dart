import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/model/user/user.dart';
import 'package:tasuke_ai/model/user/valueobject/uid.dart';
import 'package:tasuke_ai/model/user/valueobject/name.dart';
import 'package:tasuke_ai/model/user/valueobject/email.dart';
import 'package:tasuke_ai/model/user/valueobject/password.dart';

class UserFactory {
  final String _uid;
  final String _name;
  final String _email;
  final String _password;

  UserFactory({
    @required String uid,
    @required String name,
    @required String email,
    @required String password,
  })  : _uid = uid,
        _name = name,
        _email = email,
        _password = password;

  User make() {
    return User(
      uid: Uid(uid: _uid),
      name: Name(name: _name),
      email: Email(email: _email),
      password: Password(password: _password),
    );
  }
}
