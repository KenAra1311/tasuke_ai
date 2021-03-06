import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/widgets/organisms/footer.dart';
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
          title: 'ホーム',
          backgroundColor: Color(0xfff44436),
          iconThemeColor: Color(0xffffffff),
          isReturnButton: false,
        ),
        body: _Body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => null,
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
