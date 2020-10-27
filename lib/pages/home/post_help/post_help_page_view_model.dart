import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tasuke_ai/service/home/post_help/post_help_service.dart';
import 'package:tasuke_ai/service/validator/post_validator.dart';
import 'package:tasuke_ai/widgets/atoms/show_date_picker.dart';
import 'package:tasuke_ai/widgets/atoms/show_time_picker.dart';

class PostHelpPageModelView extends ChangeNotifier {
  PostHelpService _postHelpService;
  PostValidator _postValidator;
  TextEditingController _titleTextController;
  TextEditingController _descriptionTextController;
  TextEditingController _durationTextController;
  String _date;
  String _time;
  String _createdAt;
  bool _titleValidate;
  bool _durationValidate;
  bool _visible;
  String _info;

  PostHelpPageModelView() {
    initializeDateFormatting('ja');

    _postHelpService = PostHelpService();
    _postValidator = PostValidator();
    _titleTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    _durationTextController = TextEditingController();
    _date = DateFormat.yMMMEd('ja').format(DateTime.now());
    _time = DateFormat.Hm('ja').format(DateTime.now());
    _createdAt = Timestamp.now().toDate().toString();
    _titleValidate = false;
    _durationValidate = false;
    _visible = false;
    _info = '';
  }

  TextEditingController get titleTextController => _titleTextController;
  TextEditingController get descriptionTextController => _descriptionTextController;
  TextEditingController get durationTextController => _durationTextController;
  String get date => _date;
  String get time => _time;
  String get createdAt => _createdAt;
  bool get titleValidate => _titleValidate;
  bool get durationValidate => _durationValidate;
  bool get visible => _visible;
  String get info => _info;

  /*
   * 日付の選択操作を実行させる
   */
  Future<void> selectDate({@required BuildContext context}) async {
    _date = await ShowDatePicker(
      context: context,
      date: date,
    ).selectDate();

    notifyListeners();
  }

  /*
   * 時間の選択操作を実行させる
   */
  Future<void> selectTime({@required BuildContext context}) async {
    _time = await ShowTimePicker(
      context: context,
      time: time,
    ).selectTime();

    notifyListeners();
  }

  /*
   * 投稿を実行し、バリデーションがOKならば保存＆リダイレクトを行う
   */
  Future postHelp({@required BuildContext context}) async {
    // 入力レベルのバリデーションチェック
    _titleValidate = _postValidator.titleValidator(title: titleTextController.text);
    _durationValidate = _postValidator.durationValidator(duration: durationTextController.text);
    if (titleValidate  || durationValidate) {
      notifyListeners();
      return;
    }

    _visible = true;
    notifyListeners();

    _info = await _postHelpService.postHelp(
      context: context,
      title: titleTextController.text,
      description: descriptionTextController.text,
      date: date,
      time: time,
      duration: durationTextController.text,
      createdAt: createdAt,
    );

    _visible = false;
    notifyListeners();
  }
}
