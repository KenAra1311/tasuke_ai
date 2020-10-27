import 'package:flutter/material.dart';
import 'package:tasuke_ai/model/post_help/post_help.dart';
import 'package:tasuke_ai/model/post_help/valueobject/date_time.dart';
import 'package:tasuke_ai/model/post_help/valueobject/description.dart';
import 'package:tasuke_ai/model/post_help/valueobject/duration.dart';
import 'package:tasuke_ai/model/post_help/valueobject/title.dart' as TitleModel;
import 'package:tasuke_ai/model/post_help/valueobject/uid.dart';

class PostHelpFactory {
  final String _uid;
  final String _title;
  final String _description;
  final String _dateTime;
  final String _duration;

  PostHelpFactory({
    @required String uid,
    @required String title,
    @required String description,
    @required String dateTime,
    @required String duration,
  })  : _uid = uid,
        _title = title,
        _description = description,
        _dateTime = dateTime,
        _duration = duration;

  PostHelp make() {
    return PostHelp(
      uid: Uid(uid: _uid),
      title: TitleModel.Title(title: _title),
      description: Description(description: _description),
      dateTime: DateTime(dateTime: _dateTime),
      duration: Duration(duration: _duration),
    );
  }
}
