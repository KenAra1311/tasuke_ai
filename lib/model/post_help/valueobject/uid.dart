import 'package:flutter/cupertino.dart';

class Uid {
  final _uid;

  Uid({@required String uid}) : _uid = uid {
    if (uid.isEmpty || uid == null) {
      throw Exception('UIDは必須です');
    }
  }

  String get value => _uid;
}
