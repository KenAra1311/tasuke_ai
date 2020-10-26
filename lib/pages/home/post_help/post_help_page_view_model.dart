import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/home/post_help/post_help_service.dart';
import 'package:tasuke_ai/service/validator/post_validator.dart';

class PostHelpPageModelView extends ChangeNotifier {
  PostHelpService _postHelpService;
  PostValidator _postValidator;
  TextEditingController _titleTextController;
  TextEditingController _descriptionTextController;
  bool _titleValidate;
  bool _visible;
  String _info;

  PostHelpPageModelView() {
    _postHelpService = PostHelpService();
    _postValidator = PostValidator();
    _titleTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    _titleValidate = false;
    _visible = false;
    _info = '';
  }

  TextEditingController get titleTextController => _titleTextController;
  TextEditingController get descriptionTextController => _descriptionTextController;
  bool get titleValidate => _titleValidate;
  bool get visible => _visible;
  String get info => _info;

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
