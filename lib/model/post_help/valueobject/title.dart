import 'package:flutter/material.dart';

class Title {
  final _title;

  Title({@required String title}) : _title = title {
    if (title.isEmpty || title == null) {
      throw Exception('タイトルが入力されておりません');
    }
  }

  String get value => _title;
}
