import 'package:flutter/cupertino.dart';

class Name {
  final _name;

  Name({@required String name}) : _name = name {
    if (name.isEmpty || name == null) {
      throw Exception('アカウント名が入力されておりません');
    }
  }

  String get value => _name;
}
