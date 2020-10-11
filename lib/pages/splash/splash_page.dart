import 'package:flutter/material.dart';

import 'splash_page_view_model.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashPageModelView().setTimer(context: context);

    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Container(
      color: Color(0xfff44436),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('lib/assets/image/icon.png')
          ),
          Icon(
            Icons.favorite,
            color: Color(0xffffffff),
            size: 36.0,
          ),
        ],
      ),
    );
  }
}
