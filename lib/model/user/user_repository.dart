import 'package:flutter/cupertino.dart';

import 'user.dart';

abstract class UserRepository {
  Future<Map<String, dynamic>> getSelf({@required String uid});
  Future store({@required User user});
  Future update({@required User user, @required String uid});
}
