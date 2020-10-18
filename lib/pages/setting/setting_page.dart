import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/pages/setting/setting_page_view_model.dart';
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
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        InkWell(
          onTap: () => _showDialog(context: context),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'サインアウト',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _showDialog({@required BuildContext context}) async {
    final _settingPageModelView = Provider.of<SettingPageModelView>(context, listen: false);

    return await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('サインアウト'),
        content: Text('サインアウトしますがよろしいでしょうか？'),
        actions: <Widget>[
          FlatButton(
            child: Text('はい'),
            onPressed: () => _settingPageModelView.signOutUser(context: context),
          ),
          FlatButton(
            child: Text('いいえ'),
            textColor: Colors.redAccent,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
