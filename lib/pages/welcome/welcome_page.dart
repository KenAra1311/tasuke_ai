import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context)
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: 50),
            child: Text(
              '『助け愛』\nへようこそ',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 80,
            child: FlatButton(
              onPressed: () => Navigator.of(context).pushNamed('/sign-up'),
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Text(
                '新規登録する',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            child: FlatButton(
              onPressed: () => Navigator.of(context).pushNamed('/'),
              color: Colors.indigoAccent,
              textColor: Colors.white,
              child: Text(
                'ご登録済みの方はこちらから',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
