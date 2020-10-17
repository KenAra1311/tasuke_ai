import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';

import 'home_page_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageModelView()),
      ],
      child: Scaffold(
        appBar: Header(
          title: '助け愛',
          backgroundColor: Color(0xfff44436),
          iconThemeColor: Color(0xffffffff),
          isReturnButton: false,
        ),
        body: _Body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => null,
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homePageModelView = Provider.of<HomePageModelView>(context);

    return Container(
      child: Center(
        child: Text(_homePageModelView.getAuthenticatedUser().email),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _homePageModelView = Provider.of<HomePageModelView>(context);

    return BottomAppBar(
      color: Colors.redAccent,
      elevation: 0.0,
      notchMargin: 6.0,
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(),
        StadiumBorder(
          side: BorderSide(),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.message_outlined,
                color: Colors.white,
              ),
              onPressed: () => null,
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () => null,
            ),
          ],
        ),
      ),
    );
  }
}
