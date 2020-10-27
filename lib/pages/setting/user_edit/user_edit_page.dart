import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/pages/setting/user_edit/user_edit_page_view_model.dart';
import 'package:tasuke_ai/widgets/molecules/overlay_loading.dart';
import 'package:tasuke_ai/widgets/molecules/show_info.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';

class UserEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserEditPageModelView()),
      ],
      child: Scaffold(
        appBar: Header(
          title: 'アカウント編集',
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
    final _userEditPageModelView = Provider.of<UserEditPageModelView>(context);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: ShowInfo(info: _userEditPageModelView.info),
              ),
              TextFormField(
                controller: _userEditPageModelView.nameTextController,
                decoration: InputDecoration(
                  labelText: 'アカウント名',
                  errorText: _userEditPageModelView.nameValidate ? 'アカウント名を入力してください' : null
                ),
              ),
              TextFormField(
                controller: _userEditPageModelView.oldEmailTextController,
                decoration: InputDecoration(
                  labelText: '現在のメールアドレス',
                  errorText: _userEditPageModelView.oldEmailValidate ? 'メールアドレスを正しい形式で入力してください' : null
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _userEditPageModelView.oldPasswordTextController,
                decoration: InputDecoration(
                  labelText: '現在のパスワード',
                  errorText: _userEditPageModelView.oldPasswordValidate ? 'パスワードは6文字以上で入力してください' : null
                ),
                obscureText: true,
              ),
              TextFormField(
                controller: _userEditPageModelView.emailTextController,
                decoration: InputDecoration(
                  labelText: '新しいメールアドレス',
                  errorText: _userEditPageModelView.emailValidate ? 'メールアドレスを正しい形式で入力してください' : null
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _userEditPageModelView.passwordTextController,
                decoration: InputDecoration(
                  labelText: '新しいパスワード',
                  errorText: _userEditPageModelView.passwordValidate ? 'パスワードは6文字以上で入力してください' : null
                ),
                obscureText: true,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  onPressed: () => _userEditPageModelView.updateUser(),
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('変更を登録する'),
                ),
              ),
            ],
          ),
        ),
        OverlayLoading(visible: _userEditPageModelView.visible),
      ],
    );
  }
}
