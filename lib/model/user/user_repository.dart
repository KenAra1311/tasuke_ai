import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'user.dart' as UserModel;

abstract class UserRepository {
  User getAuthenticatedUser();
  Future store({@required UserModel.User user});
  void signOutUser({@required BuildContext context});
}
