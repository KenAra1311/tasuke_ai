import 'package:flutter/material.dart';

class CreatedAt {
  final _createdAt;

  CreatedAt({@required String createdAt}) : _createdAt = createdAt {
    if (createdAt.isEmpty || createdAt == null) {
      throw Exception('登録日時は必須です');
    }
  }

  String get value => _createdAt;
}
