import 'package:flutter/material.dart';

class DateTime {
  final _dateTime;

  DateTime({@required String dateTime}) : _dateTime = dateTime {
    if (dateTime.isEmpty || dateTime == null) {
      throw Exception('日付・時間の指定は必須です');
    }
  }

  String get value => _dateTime;
}
