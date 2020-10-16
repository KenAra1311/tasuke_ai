import 'package:flutter/material.dart';

class ShowInfo extends StatelessWidget {
  final String info;

  ShowInfo({
    @required this.info,
  });

  @override
  Widget build(BuildContext context) {
    if (info == '') {
      return Container();
    } else {
      return Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Text(
          info,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.redAccent
          ),
        ),
      );
    }
  }
}
