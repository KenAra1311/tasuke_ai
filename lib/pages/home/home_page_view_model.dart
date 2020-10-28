import 'package:flutter/material.dart';
import 'package:tasuke_ai/model/post_help/post_help.dart';
import 'package:tasuke_ai/service/home/home_service.dart';

class HomePageModelView extends ChangeNotifier {
  HomeService _homeService;

  HomePageModelView() {
    _homeService = HomeService();
  }

  Future<List<PostHelp>> getPostHelps() {
    return _homeService.getPostHelps();
  }
}
