import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';
import 'package:tasuke_ai/widgets/molecules/show_info.dart';

import 'sign_in_page_view_model.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInPageModelView()),
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
    final _signInPageModelView = Provider.of<SignInPageModelView>(context);

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              '登録したアカウント情報を入力してください',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: ShowInfo(info: _signInPageModelView.info),
          ),
          TextFormField(
            controller: _signInPageModelView.emailTextController,
            decoration: InputDecoration(
              labelText: 'メールアドレス',
              errorText: _signInPageModelView.emailValidate ? 'メールアドレスを正しい形式で入力してください' : null
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            controller: _signInPageModelView.passwordTextController,
            decoration: InputDecoration(
              labelText: 'パスワード',
              errorText: _signInPageModelView.passwordValidate ? 'パスワードは6文字以上で入力してください' : null
            ),
            obscureText: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              onPressed: () => _signInPageModelView.signInUser(context: context),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('サインインする'),
            ),
          ),
        ],
      ),
    );
  }
}
