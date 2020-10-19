import 'package:flutter/cupertino.dart';

class UserEditPageModelView extends ChangeNotifier {
  TextEditingController _nameTextController;
  TextEditingController _emailTextController;
  TextEditingController _passwordTextController;
  bool _visible;
  String _info;

  UserEditPageModelView() {
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
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
