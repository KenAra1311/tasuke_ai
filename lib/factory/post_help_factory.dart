import 'package:flutter/material.dart';
import 'package:tasuke_ai/model/post_help/post_help.dart';
import 'package:tasuke_ai/model/post_help/valueobject/description.dart';
import 'package:tasuke_ai/model/post_help/valueobject/title.dart' as TitleModel;
import 'package:tasuke_ai/model/post_help/valueobject/uid.dart';

class PostHelpFactory {
  final String _uid;
  final String _title;
  final String _description;

  PostHelpFactory({
    @required String uid,
    @required String title,
    @required String description,
  })  : _uid = uid,
        _title = title,
        _description = description;

  PostHelp make() {
    return PostHelp(
      uid: Uid(uid: _uid),
      title: TitleModel.Title(title: _title),
      description: Description(description: _description),
    );
  }
}
