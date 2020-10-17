import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';

import 'home_page_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageModelView()),
      ],
      child: Scaffold(
        appBar: Header(
          title: '助け愛',
          backgroundColor: Color(0xfff44436),
          iconThemeColor: Color(0xffffffff),
          isReturnButton: false,
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homePageModelView = Provider.of<HomePageModelView>(context);

    return Container(
      child: Center(
        child: Text(_homePageModelView.getAuthenticatedUser().email),
      ),
    );
  }
}
