import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color iconThemeColor;
  final bool isReturnButton;

  Header({
    @required this.title,
    @required this.backgroundColor,
    @required this.iconThemeColor,
    this.isReturnButton,
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
      automaticallyImplyLeading: isReturnButton,
    );
  }
}
