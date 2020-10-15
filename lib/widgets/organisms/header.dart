import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color iconThemeColor;

  Header({
    @required this.title,
    @required this.backgroundColor,
    @required this.iconThemeColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: iconThemeColor),
      elevation: 0.0,
    );
  }
}
