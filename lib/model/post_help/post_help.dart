import 'package:flutter/material.dart';

import 'valueobject/uid.dart';
import 'valueobject/title.dart' as TitleModel;
import 'valueobject/description.dart';
import 'valueobject/date_time.dart';
import 'valueobject/duration.dart';

class PostHelp {
  final Uid _uid;
  final TitleModel.Title _title;
  final Description _description;
  final DateTime _dateTime;
  final Duration _duration;

  PostHelp({
    @required Uid uid,
    @required TitleModel.Title title,
    @required Description description,
    @required DateTime dateTime,
    @required Duration duration,
  })  : _uid = uid,
        _title = title,
        _description = description,
        _dateTime = dateTime,
        _duration = duration;

  Uid get uid => _uid;
  TitleModel.Title get title => _title;
  Description get description => _description;
  DateTime get date => _dateTime;
  Duration get duration => _duration;

  Map<String, String> toMap() {
    return {
      'uid': _uid.value.toString(),
      'title': _title.value.toString(),
      'description': _description.value.toString(),
      'dateTime': _dateTime.value.toString(),
      'duration': _duration.value.toString(),
    };
  }
}
