import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/widgets/molecules/overlay_loading.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';
import 'package:tasuke_ai/widgets/molecules/show_info.dart';

import 'sign_up_page_view_model.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpPageModelView()),
      ],
      child: Scaffold(
        appBar: Header(
          title: '',
          backgroundColor: Color(0xfffafafa),
          iconThemeColor: Color(0xff000000),
        ),
        body: _Body()
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _signUpPageModelView = Provider.of<SignUpPageModelView>(context);

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.clip,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  '登録するアカウント情報を入力してください',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: ShowInfo(info: _signUpPageModelView.info),
              ),
              TextFormField(
                controller: _signUpPageModelView.nameTextController,
                decoration: InputDecoration(
                  labelText: 'アカウント名',
                  errorText: _signUpPageModelView.nameValidate ? 'アカウント名を入力してください' : null
                ),
              ),
              TextFormField(
                controller: _signUpPageModelView.emailTextController,
                decoration: InputDecoration(
                  labelText: 'メールアドレス',
                  errorText: _signUpPageModelView.emailValidate ? 'メールアドレスを正しい形式で入力してください' : null
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _signUpPageModelView.passwordTextController,
                decoration: InputDecoration(
                  labelText: 'パスワード',
                  errorText: _signUpPageModelView.passwordValidate ? 'パスワードは6文字以上で入力してください' : null
                ),
                obscureText: true,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  onPressed: () => _signUpPageModelView.signUpUser(context: context),
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('アカウントを登録する'),
                ),
              ),
            ],
          ),
        ),
        OverlayLoading(visible: _signUpPageModelView.visible),
      ],
    );
  }
}
