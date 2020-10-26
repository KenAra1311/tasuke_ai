import 'package:flutter/material.dart';

import 'valueobject/uid.dart';
import 'valueobject/title.dart' as TitleModel;
import 'valueobject/description.dart';

class PostHelp {
  final Uid _uid;
  final TitleModel.Title _title;
  final Description _description;

  PostHelp({
    @required Uid uid,
    @required TitleModel.Title title,
    @required Description description,
  })  : _uid = uid,
        _title = title,
        _description = description;

  Uid get uid => _uid;
  TitleModel.Title get title => _title;
  Description get description => _description;

  Map<String, String> toMap() {
    return {
      'uid': _uid.value.toString(),
      'title': _title.value.toString(),
      'description': _description.value.toString(),
    };
  }
}
