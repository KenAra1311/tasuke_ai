import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/pages/setting/setting_page_view_model.dart';
import 'package:tasuke_ai/widgets/organisms/footer.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingPageModelView()),
      ],
      child: Scaffold(
        appBar: Header(
          title: '設定',
          backgroundColor: Color(0xfff44436),
          iconThemeColor: Color(0xffffffff),
        ),
        body: _Body(),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homePageModelView = Provider.of<SettingPageModelView>(context);

    return Container(
      child: Center(
        child: Text(_homePageModelView.getAuthenticatedUser().email),
      ),
    );
  }
}
