import 'package:tasuke_ai/model/post_help/post_help.dart';
import 'package:tasuke_ai/repositories/firebase/firebase_post_help_repository.dart';

class HomeService {
  /*
   * 全ての投稿を取得する
   */
  Future<List<PostHelp>> getPostHelps() {
    return FirebasePostHelpRepository().get();
  }
}
