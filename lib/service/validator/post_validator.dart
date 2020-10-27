import 'package:flutter/cupertino.dart';

class PostValidator {
  /*
   * タイトルのバリデーション
   */
  bool titleValidator({@required String title}) {
    return title.isEmpty ? true : false;
  }

  /*
   * 所要時間のバリデーション
   */
  bool durationValidator({@required String duration}) {
    return duration.isEmpty ? true : false;
  }
}
