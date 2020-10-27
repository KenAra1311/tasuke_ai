import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/pages/setting/user_delete/user_delete_page_view_model.dart';
import 'package:tasuke_ai/widgets/molecules/overlay_loading.dart';
import 'package:tasuke_ai/widgets/molecules/show_info.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';

class UserDeletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDeletePageModelView()),
      ],
      child: Scaffold(
        appBar: Header(
          title: 'アカウント削除',
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
    final _userDeletePageModelView = Provider.of<UserDeletePageModelView>(context);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: ShowInfo(info: _userDeletePageModelView.info),
              ),
              TextFormField(
                controller: _userDeletePageModelView.passwordTextController,
                decoration: InputDecoration(
                  labelText: 'パスワード',
                  errorText: _userDeletePageModelView.passwordValidate ? 'パスワードは6文字以上で入力してください' : null
                ),
                obscureText: true,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  onPressed: () => _userDeletePageModelView.deleteUser(context: context),
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('アカウントを削除する'),
                ),
              ),
            ],
          ),
        ),
        OverlayLoading(visible: _userDeletePageModelView.visible),
      ],
    );
  }
}
