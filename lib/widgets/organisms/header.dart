import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color iconThemeColor;
  final bool isReturnButton;
  final bool isPopupMenuButton;

  Header({
    @required this.title,
    @required this.backgroundColor,
    @required this.iconThemeColor,
    this.isReturnButton = true,
    this.isPopupMenuButton = false,
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
      actions: <Widget>[
        Visibility(
          visible: isPopupMenuButton,
          child: PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: InkWell(
                    onTap: () => null,
                    child: Text('サインアウト'),
                  ),
                ),
              ];
            }
          ),
        ),
      ],
    );
  }
}
