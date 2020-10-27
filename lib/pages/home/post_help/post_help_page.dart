import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasuke_ai/widgets/molecules/overlay_loading.dart';
import 'package:tasuke_ai/widgets/molecules/show_info.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';

import 'post_help_page_view_model.dart';

class PostHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostHelpPageModelView()),
      ],
      child: Scaffold(
        appBar: Header(
          title: '投稿',
          backgroundColor: Color(0xfff44436),
          iconThemeColor: Color(0xffffffff),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _postHelpPageModelView = Provider.of<PostHelpPageModelView>(context);

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.clip,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 50),
                  alignment: Alignment.topCenter,
                  child: Text('家事や力を貸してほしいことなどを発信しましょう！'),
                ),
                Container(
                  child: ShowInfo(info: _postHelpPageModelView.info),
                ),
                TextFormField(
                  controller: _postHelpPageModelView.titleTextController,
                  decoration: InputDecoration(
                    labelText: 'タイトル',
                    errorText: _postHelpPageModelView.titleValidate ? 'タイトルは必ず入力してください' : null
                  ),
                ),
                TextFormField(
                  controller: _postHelpPageModelView.descriptionTextController,
                  decoration: InputDecoration(labelText: '説明'),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text('日付'),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () => _postHelpPageModelView.selectDate(context: context),
                        color: Colors.white.withOpacity(0.7),
                        textColor: Colors.redAccent,
                        child: Text(_postHelpPageModelView.date),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text('時間'),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () => null,
                        color: Colors.white.withOpacity(0.7),
                        textColor: Colors.redAccent,
                        child: Text(_postHelpPageModelView.time),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _postHelpPageModelView.titleTextController,
                  decoration: InputDecoration(
                    labelText: 'おおよそかかる時間',
                    hintText: 'およそ１時間程度',
                    errorText: _postHelpPageModelView.titleValidate ? 'タイトルは必ず入力してください' : null
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  width: double.infinity,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () => _postHelpPageModelView.postHelp(context: context),
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('投稿する'),
                  ),
                ),
              ],
            ),
          ),
        ),
        OverlayLoading(visible: _postHelpPageModelView.visible),
      ],
    );
  }
}
