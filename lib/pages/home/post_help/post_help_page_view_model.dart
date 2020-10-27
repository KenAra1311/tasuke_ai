import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tasuke_ai/service/home/post_help/post_help_service.dart';
import 'package:tasuke_ai/service/validator/post_validator.dart';
import 'package:tasuke_ai/widgets/atoms/show_date_picker.dart';

class PostHelpPageModelView extends ChangeNotifier {
  PostHelpService _postHelpService;
  PostValidator _postValidator;
  TextEditingController _titleTextController;
  TextEditingController _descriptionTextController;
  String _date;
  String _time;
  bool _titleValidate;
  bool _visible;
  String _info;

  PostHelpPageModelView() {
    initializeDateFormatting('ja');

    _postHelpService = PostHelpService();
    _postValidator = PostValidator();
    _titleTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    _date = DateFormat.yMMMd('ja').format(DateTime.now());
    _time = DateFormat.Hm('ja').format(DateTime.now());
    _titleValidate = false;
    _visible = false;
    _info = '';
  }

  TextEditingController get titleTextController => _titleTextController;
  TextEditingController get descriptionTextController => _descriptionTextController;
  String get date => _date;
  String get time => _time;
  bool get titleValidate => _titleValidate;
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
   * 投稿を実行し、バリデーションがOKならば保存＆リダイレクトを行う
   */
  Future postHelp({@required BuildContext context}) async {
    // 入力レベルのバリデーションチェック
    _titleValidate = _postValidator.titleValidator(title: titleTextController.text);
    if (titleValidate) {
      notifyListeners();
      return;
    }

    _visible = true;
    notifyListeners();

    _info = await _postHelpService.postHelp(
      context: context,
      title: titleTextController.text,
      description: descriptionTextController.text,
    );

    _visible = false;
    notifyListeners();
  }
}
