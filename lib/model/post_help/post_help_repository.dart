import 'package:flutter/material.dart';

import 'post_help.dart';

abstract class PostHelpRepository {
  Future store({@required PostHelp postHelp});
}
