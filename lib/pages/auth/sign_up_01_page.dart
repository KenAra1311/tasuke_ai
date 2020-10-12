import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';

import 'sign_up_page_view_model.dart';

class SignUp01Page extends StatelessWidget {
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

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              'アカウント情報を入力してください',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _signUpPageModelView.emailTextController,
            decoration: InputDecoration(labelText: 'メールアドレス'),
          ),
          TextFormField(
            controller: _signUpPageModelView.passwordTextController,
            decoration: InputDecoration(labelText: 'パスワード'),
            obscureText: true,
          ),
          TextFormField(
            controller: _signUpPageModelView.passwordConfirmTextController,
            decoration: InputDecoration(labelText: 'パスワード（確認用）'),
            obscureText: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/home'),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('次に進む'),
            ),
          ),
        ],
      ),
    );
  }
}
