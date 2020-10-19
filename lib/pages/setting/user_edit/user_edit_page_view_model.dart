import 'package:flutter/cupertino.dart';
import 'package:tasuke_ai/service/setting/user_edit/user_edit_service.dart';

class UserEditPageModelView extends ChangeNotifier {
  UserEditService _userEditService;
  TextEditingController _nameTextController;
  TextEditingController _emailTextController;
  TextEditingController _passwordTextController;
  bool _visible;
  String _info;

  UserEditPageModelView() {
    _userEditService = UserEditService();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _userEditService.getSelf().then((value) {
      _nameTextController.text = value['name'];
      _emailTextController.text = value['email'];
    });

    _visible = false;
    _info = '';
  }

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  bool get visible => _visible;
  String get info => _info;

  // Future updateUser() async {}
}
