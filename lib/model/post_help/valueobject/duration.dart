import 'package:flutter/material.dart';

class Duration {
  final _duration;

  Duration({@required String duration}) : _duration = duration {
    if (duration.isEmpty || duration == null) {
      throw Exception('所要時間は必須です');
    }
  }

  String get value => _duration;
}
