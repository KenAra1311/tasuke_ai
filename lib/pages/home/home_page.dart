import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/model/post_help/post_help.dart';
import 'package:tasuke_ai/widgets/molecules/overlay_loading.dart';
import 'package:tasuke_ai/widgets/organisms/footer.dart';
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
          title: 'ホーム',
          backgroundColor: Color(0xfff44436),
          iconThemeColor: Color(0xffffffff),
          isReturnButton: false,
        ),
        body: _Body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/home/post-help'),
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homePageModelView = Provider.of<HomePageModelView>(context);

    return FutureBuilder(
      future: _homePageModelView.getPostHelps(),
      builder: (BuildContext context, AsyncSnapshot<List<PostHelp>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (!snapshot.hasData) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              OverlayLoading(visible: true),
            ],
          );
        }

        return Container(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: snapshot.data.map((postHelp) => _showPostHelp(postHelp: postHelp)).toList(),
          ),
        );
      }
    );
  }

  Widget _showPostHelp({@required PostHelp postHelp}) {
    return Column(
      children: <Widget>[
        Text(postHelp.title.value),
        Text(postHelp.description.value),
        Text(postHelp.dateTime.value),
        Text(postHelp.duration.value),
        Text(postHelp.createdAt.value),
      ],
    );
  }
}
