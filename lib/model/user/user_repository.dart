import 'package:flutter/cupertino.dart';

import 'user.dart';

abstract class UserRepository {
  Future store({@required User user});
}
