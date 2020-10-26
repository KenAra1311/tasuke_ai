import 'package:flutter/cupertino.dart';

class PostHelpPageModelView extends ChangeNotifier {
  TextEditingController _titleTextController;
  TextEditingController _descriptionTextController;
  bool _titleValidate;
  bool _visible;

  PostHelpPageModelView() {
    _titleTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    _titleValidate = false;
    _visible = false;
  }

  TextEditingController get titleTextController => _titleTextController;
  TextEditingController get descriptionTextController => _descriptionTextController;
  bool get titleValidate => _titleValidate;
  bool get visible => _visible;
}
