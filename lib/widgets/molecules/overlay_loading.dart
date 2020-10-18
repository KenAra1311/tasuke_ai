import 'package:flutter/material.dart';

class OverlayLoading extends StatelessWidget {
  final bool visible;

  OverlayLoading({
    @required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return Container();
    } else {
      return Container(
        decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)),
          ],
        ),
      );
    }
  }
}
