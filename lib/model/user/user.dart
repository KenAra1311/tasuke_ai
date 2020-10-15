import 'package:flutter/cupertino.dart';

import 'valueobject/uid.dart';
import 'valueobject/name.dart';
import 'valueobject/email.dart';

class User {
  final Uid _uid;
  final Name _name;
  final Email _email;

  User({
    @required Uid uid,
    @required Name name,
    @required Email email,
  })  : _uid = uid,
        _name = name,
        _email = email;

  Uid get uid => _uid;
  Name get name => _name;
  Email get email => _email;

  Map<String, String> toMap() {
    return {
      'uid': _uid.value.toString(),
      'name': _name.value.toString(),
      'email': _email.value.toString(),
    };
  }
}
