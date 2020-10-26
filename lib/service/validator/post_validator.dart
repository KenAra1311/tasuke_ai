import 'package:flutter/cupertino.dart';

class PostValidator {
  /*
   * タイトルのバリデーション
   */
  bool titleValidator({@required String title}) {
    return title.isEmpty ? true : false;
  }
}
